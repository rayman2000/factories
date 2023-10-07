from dataclasses import dataclass
from functools import lru_cache
from math import ceil
import luadata


@dataclass
class Item:
    id: int
    name: str
    complexity = -1


@dataclass
class Recipe:
    """We convert everything to items per second"""

    id: int
    name: str
    inputs: dict[int, float]
    outputs: dict[int, float]
    type: str

    def to_string(self, num: int = 1) -> str:
        input_string = ", ".join(
            [
                f"{round(amount * num * 60, 2)} {get_item(inp).name}"
                for inp, amount in self.inputs.items()
            ]
        )
        output_string = ", ".join(
            [
                f"{round(amount * num * 60, 2)} {get_item(out).name}"
                for out, amount in self.outputs.items()
            ]
        )
        return f"{num} {self.type.lower()} creating {output_string} per minute from {input_string}"


raw_items = luadata.read("items.lua")

items = [Item(id, raw["name"]) for id, raw in raw_items.items()]

raw_recipes = luadata.read("recipes.lua")

recipes: list[Recipe] = []

for rec in raw_recipes:
    time = float(rec["seconds"])
    inputs = {a: b / time for a, b in zip(rec["inputs"][0::2], rec["inputs"][1::2])}
    outputs = {a: b / time for a, b in zip(rec["outputs"][0::2], rec["outputs"][1::2])}
    recipe = Recipe(rec["id"], rec["name"], inputs, outputs, rec["type"])
    recipes.append(recipe)


@lru_cache
def get_item(item_id: int) -> Item:
    for item in items:
        if item.id == item_id:
            return item
    raise ValueError(f"Item with id {item_id} not found")


@lru_cache
def get_recipe_from_id(rec_id: int) -> Recipe:
    for rec in recipes:
        if rec.id == rec_id:
            return rec
    raise ValueError(f"Recipe with id {rec_id} not found")


@lru_cache
def get_default_recipe(item_id: int) -> Recipe:
    # Some manual overrides:
    if item_id == 1109:  # Energetic Graphite
        return get_recipe_from_id(17)

    if item_id == 1114:  # Refined Oil
        return get_recipe_from_id(16)

    if item_id == 1117:  # Organic Chrystal
        return get_recipe_from_id(25)

    if item_id == 1120:  # Hydrogen
        return get_recipe_from_id(16)

    recs = [rec for rec in recipes if item_id in rec.outputs]

    if len(recs) == 0:
        return None
    #if len(recs) > 1:
        #item = get_item(item_id)
        #print(f"Multiple recipes found for {item.name}. Using the first one")
    return recs[0]


def print_duplicate_recipes():
    for item in items:
        item_recipes = []
        for rec in recipes:
            if item.id in rec.outputs:
                item_recipes.append(rec)
        if len(item_recipes) > 1:
            print(f"{item.name} has multiple recipes:")
            for rec in item_recipes:
                print(f"  {rec.to_string()}")



@lru_cache
def get_complexity(item_id: Item):
    rec = get_default_recipe(item_id)
    if rec is None:
        return 0
    return 1 + max(get_complexity(i) for i in rec.inputs)


for item in items:
    item.complexity = get_complexity(item.id)

max_complexity = max(item.complexity for item in items)


def get_factory(output: dict[int, int], provided: list[int]):
    required_items: dict[int, float] = {item.id: 0 for item in items}
    for item_id, amount in output.items():
        rec = get_default_recipe(item_id)
        required_items[item_id] += amount * rec.outputs[item_id]

    required_recipes: dict[int, int] = {}

    # Do everything with default recipes
    for com in range(max_complexity, 0, -1):
        for item in items:
            if item.complexity != com:
                continue

            if item.id in provided:
                continue

            rec = get_default_recipe(item.id)

            number = ceil(required_items[item.id] / rec.outputs[item.id])
            if number > 0:
                required_recipes[rec.id] = number

                for inp, amount in rec.inputs.items():
                    required_items[inp] += amount * number

                for out, amount in rec.outputs.items():
                    required_items[out] -= amount * number

    # TODO Do optimisation with non-default recipes: extra hydrogen and extra refined oil...

    for rec_id, num in required_recipes.items():
        rec = get_recipe_from_id(rec_id)
        print(rec.to_string(num))

    for item_id, amount in required_items.items():
        if amount > 0:
            item = get_item(item_id)
            print(f"Input {round(amount * 60, 2)} {item.name} ")
        if amount < 0:
            item = get_item(item_id)
            print(f"Excess {round(-amount * 60, 2)} {item.name}")


# Electromagnetic Turbine
# get_factory({1204: 1}, [])

# Plasma Exciter
# get_factory({1401: 1}, [])

# Prcocessor
# get_factory({1303: 1}, [])

# Science
get_factory({6003: 3}, [1106])

# Solar Sail
# get_factory({1501: 1}, [1301])