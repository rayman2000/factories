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


raw_items = luadata.read("items.lua")

items = [Item(id, raw["name"]) for id, raw in raw_items.items()]

raw_recipes = luadata.read("recipes.lua")

recipes: list[Recipe] = []

for rec in raw_recipes:
    time = float(rec["seconds"])
    inputs = {a: b/time for a, b in zip(rec["inputs"][0::2], rec["inputs"][1::2])}
    outputs = {a: b/time for a, b in zip(rec["outputs"][0::2], rec["outputs"][1::2])}
    recipe = Recipe(rec["id"], rec["name"], inputs, outputs, rec["type"])
    recipes.append(recipe)


@lru_cache
def get_item(item_id: int) -> Item:
    for item in items:
        if item.id == item_id:
            return item
    raise ValueError(f"Item with id {item_id} not found")


@lru_cache
def get_recipe(item_id: int) -> Recipe:
    for rec in recipes:
        if item_id in rec.outputs:
            return rec
    # return [rec for rec in recipes if item_id in rec.outputs]


@lru_cache
def get_complexity(item_id: Item):
    rec = get_recipe(item_id)
    if rec is None:
        return 0    
    return 1 + max(get_complexity(i) for i in rec.inputs)


for item in items:
    item.complexity = get_complexity(item.id)

max_complexity = max(item.complexity for item in items)


def get_factory(output: dict[int, float]):

    required_ingredients: dict[int, float] = {item.id: 0 for item in items}
    for item_id, amount in output.items():
        required_ingredients[item_id] += amount

    required_machines: dict[int, int] = {}

    for com in range(max_complexity, 0, -1):
        for item in items:
            if item.complexity != com:
                continue

            rec = get_recipe(item.id)

            number = ceil(required_ingredients[item.id] / rec.outputs[item.id])
            if number > 0:
                required_machines[item.id] = number

            for inp, amount in rec.inputs.items():
                required_ingredients[inp] += amount * number

            for out, amount in rec.outputs.items():
                required_ingredients[out] -= amount * number

    for item_id, num in required_machines.items():
        rec = get_recipe(item_id)
        item = get_item(item_id)
        input_string = ", ".join(
            [f"{amount * num * 60} {get_item(inp).name}" for inp, amount in rec.inputs.items()]
        )
        print(
            f"{num} {rec.type.lower()} creating {rec.outputs[item_id] * num * 60} {item.name} per minute from {input_string}"
        )

    for item_id, amount in required_ingredients.items():
        item = get_item(item_id)
        if amount > 0 and item.complexity > 0:
            raise ValueError(f'Items are missing')
        if amount < 0:
            rec = get_recipe(item_id)
            if -amount > rec.outputs[item_id]:
                print("Unnecessary production of:")
            print(f"{get_item(item_id)} excess of {-amount}")

# Electormagnetic Turbine
#get_factory({1204: 0.1})

# Plasma Exciter
#get_factory({1401: 0.1})

# Prcocessor
#get_factory({1303: 0.1})

# Blue Science
get_factory({6001: 0.75})

# TODO Red Science breaks this with the double recipes stuff