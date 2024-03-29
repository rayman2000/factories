from dataclasses import dataclass
from functools import lru_cache
from math import ceil
from typing import Optional
import luadata  # type: ignore


@dataclass
class Item:
    name: str
    complexity = 0


@dataclass
class Recipe:
    name: str
    inputs: dict[str, int]
    outputs: dict[str, int]
    sec: int
    category: str

    def in_per_second(self, num: float = 1) -> dict[str, float]:
        return {inp: amount * num / self.sec for inp, amount in self.inputs.items()}

    def out_per_second(self, num: float = 1) -> dict[str, float]:
        return {out: amount * num / self.sec for out, amount in self.outputs.items()}

    def to_string(self, num: float = 1) -> str:
        input_string = ", ".join(
            [
                f"{round(amount, 2)} {inp}"
                for inp, amount in self.in_per_second(num).items()
            ]
        )
        output_string = ", ".join(
            [
                f"{round(amount, 2)} {out}"
                for out, amount in self.out_per_second(num).items()
            ]
        )
        return f"{round(num, 2)} {self.category} creating {output_string} from {input_string} per second"


raw = luadata.read("recipes/factorio.lua")

recipes: list[Recipe] = []


def parse_ingredient(ing):
    if isinstance(ing, dict):
        return (ing["name"], ing["amount"])
    else:
        return (ing[0], ing[1])


def get_crafting_speed(category: str) -> float:
    return {
        "assembling": 0.75,
        "crafting-with-fluid": 0.75,
        "crafting": 0.75,
        "advanced-crafting": 0.75,
        "smelting": 2,
    }.get(category, 1)


for rec in raw:
    cat = rec.get("category", "assembling")
    details = rec.get("normal", rec)
    sec = details.get("energy_required", 0.5) / get_crafting_speed(cat)
    inputs = {
        parse_ingredient(ing)[0]: parse_ingredient(ing)[1]
        for ing in details.get("ingredients")
    }
    if details.get("result") is not None:
        outputs = {details["result"]: details.get("result_count", 1)}
    else:
        outputs = {
            parse_ingredient(ing)[0]: parse_ingredient(ing)[1]
            for ing in details.get("results")
        }

    recipe = Recipe(rec["name"], inputs, outputs, sec, cat)
    recipes.append(recipe)

items_raw = {out for rec in recipes for out in rec.outputs}
items_raw.update({inp for rec in recipes for inp in rec.inputs})


@lru_cache
def get_default_recipe(item: str) -> Optional[Recipe]:
    # Manual overrides:

    recs = [rec for rec in recipes if item in rec.outputs]

    if len(recs) == 0:
        return None

    return recs[0]


@lru_cache
def get_recipe(name: str) -> Recipe:
    recs = [rec for rec in recipes if rec.name == name]
    # if len(recs) == 0:
    #    return None
    assert len(recs) == 1
    return recs[0]


# def print_duplicate_recipes():
#    for re in :
#        item_recipes = []
#        for rec in recipes:
#            if item.id in rec.outputs:
#                item_recipes.append(rec)
#        if len(item_recipes) > 1:
#            print(f"{item.name} has multiple recipes:")
#            for rec in item_recipes:
#                print(f"  {rec.to_string()}")


@lru_cache
def get_complexity(item: Item) -> int:
    rec = get_default_recipe(item)
    if rec is None:
        return 0
    return 1 + max(get_complexity(i) for i in rec.inputs)


items = {item: get_complexity(item) for item in items_raw}

max_complexity = max(items.values())


def add_recipe(
    rec: Recipe,
    number: float,
    required_recipes: dict[str, float],
    required_items: dict[str, float],
):
    required_recipes[rec.name] = number
    for inp, amount in rec.in_per_second(number).items():
        required_items[inp] += amount
    for out, amount in rec.out_per_second(number).items():
        required_items[out] -= amount


def get_factory(output: dict[str, float], provided: list[str] = [], excess=True):
    required_items: dict[str, float] = {item: 0 for item in items}
    for item, amount in output.items():
        rec = get_default_recipe(item)
        assert rec is not None
        required_items[item] += amount

    required_recipes: dict[str, float] = {}

    for com in range(max_complexity, 0, -1):
        for item in items:
            if items[item] != com:
                continue

            if item in provided:
                continue

            rec = get_default_recipe(item)
            assert rec is not None
            number = required_items[item] / rec.out_per_second(1)[item]

            if number > 0:
                if excess:
                    number = ceil(number)

                # Recursive stuff breaks here
                # Crack heavy and light oil if it not required

                add_recipe(rec, number, required_recipes, required_items)

    for rec_id, num in required_recipes.items():
        rec = get_recipe(rec_id)
        print(rec.to_string(num))

    for item, amount in required_items.items():
        if amount > 0:
            print(f"Input {round(amount)} {item} ")
        if amount < 0:
            print(f"Excess {-round(amount)} {item}")


# get_factory({"automation-science-pack": 1}, ["iron-plate", "copper-plate"])


get_factory(
    {"production-science-pack": 0.3},
    [
        "iron-plate",
        "copper-plate",
        "sulfur",
        "plastic-bar",
        "advanced-circuit",
        "electric-furnace",
    ],
    False,
)
# get_factory({"engine-unit": 0.1}, ["iron-plate", "copper-plate"])
# get_factory({"military-science-pack": 0.1}, ["iron-plate", "copper-plate"])
# get_factory(
#    {"utility-science-pack": 0.22},
#    [
#        "iron-plate",
#        "copper-plate",
#        "stone-brick",
#        "plastic-bar",
#        "lubricant",
#        "sulfur",
#    ],
#    False,
# )
