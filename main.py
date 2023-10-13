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

    def to_string(self, num: float = 1) -> str:
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
        return f"{round(num,2)} {self.type.lower()} creating {output_string} per minute from {input_string}"


raw_items = luadata.read("items.lua")

items = [Item(id, raw["name"]) for id, raw in raw_items.items()]
items.reverse()

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


# print(get_recipe_from_id(16).to_string(1))
# print(get_recipe_from_id(58).to_string(1))
# print(get_recipe_from_id(121).to_string(1))


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
    # if len(recs) > 1:
    # item = get_item(item_id)
    # print(f"Multiple recipes found for {item.name}. Using the first one")
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


def add_recipe(
    rec: Recipe,
    number: float,
    required_recipes: dict[int, float],
    required_items: dict[int, float],
):
    required_recipes[rec.id] = number
    for inp, amount in rec.inputs.items():
        required_items[inp] += amount * number
    for out, amount in rec.outputs.items():
        required_items[out] -= amount * number


def get_factory(output: dict[int, float], provided: list[int], excess=True):
    required_items: dict[int, float] = {item.id: 0 for item in items}
    for item_id, amount in output.items():
        rec = get_default_recipe(item_id)
        required_items[item_id] += amount * rec.outputs[item_id]

    required_recipes: dict[int, float] = {}

    for com in range(max_complexity, 0, -1):
        for item in items:
            if item.complexity != com:
                continue

            if item.id in provided:
                continue

            rec = get_default_recipe(item.id)
            number = required_items[item.id] / rec.outputs[item.id]

            if number > 0:
                if excess:
                    number = ceil(number)

                # Exceptions for hydrogen and refined oil
                if item.id == 1120:  # Hydrogen
                    number = ceil(number / 3)
                    cracks = number * 2
                    crack_rec = get_recipe_from_id(58)
                    add_recipe(crack_rec, cracks, required_recipes, required_items)

                elif item.id == 1114:  # Refined Oil
                    number = ceil(number * 2 / 3)
                    refineries = number
                    refinery_rec = get_recipe_from_id(121)
                    add_recipe(
                        refinery_rec, refineries, required_recipes, required_items
                    )

                add_recipe(rec, number, required_recipes, required_items)

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
print("\nElectromagnetic Turbine")
get_factory({1204: 1}, [])

# Plasma Exciter
print("\nPlasma Exciter")
get_factory({1401: 0.5, 1111: 0.5}, [], False)

# Processor
print("\nProcessor")
get_factory({1303: 1}, [])

# Science
print("\nScience Blue")
get_factory({6001: 6}, [])
print("\nScience Red")
get_factory({6002: 3}, [])
print("\nScience Yellow")
get_factory({6003: 3}, [1106])

# Solar Sail
print("\nSolar Sail")
get_factory({1501: 1}, [1301])

# Basic buildings: Tesla tower, Belt, Sorter, Splitter, Miner, Assembler,
print("\nBuildings")
get_factory(
    {
        2201: 0.1,  # Tesla Tower
        2001: 0.1,  # Belt 1
        2011: 0.1,  # Sorter 1
        2020: 0.01,  # Splitter
        2101: 0.1,  # Storage 1
        2204: 0.1,  # Power Plant
        2301: 0.1,  # Mining Machine
        2302: 0.1,  # Smelter
        2303: 0.1,  # Assembler 1
        2307: 0.1,  # Oil Extracter
        2308: 0.1,  # Oil Refiner
        2309: 0.1,  # Chemical Plant
        2313: 0.01,  # Spray Coater
        2901: 0.1,  # Matrix Machine
    },
    [],
    False,
)
