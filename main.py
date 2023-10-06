from dataclasses import dataclass
from enum import Enum, auto
from functools import lru_cache
from math import ceil


# An enum of the different types of ingredients
class Ingredient(Enum):
    iron_ore = auto()
    copper_ore = auto()
    stone = auto()
    coal = auto()

    iron_ingot = auto()
    copper_ingot = auto()
    stone_brick = auto()
    graphite = auto()

    magnet = auto()
    magnetic_coil = auto()
    steel = auto()
    gear = auto()
    circuit_board = auto()
    electric_motor = auto()
    electromagnetic_turbine = auto()


class Building(Enum):
    smelter = auto()
    assembler = auto()


@dataclass
class Recipe:
    inputs: dict[Ingredient, float]
    output_type: Ingredient
    output_amount: float
    time: float
    building: Building
    additional_outputs: dict[Ingredient, float] = None
    complexity = -1

    def ops(self):
        return self.output_amount / self.time


magnetic_coil_recipe = Recipe(
    {Ingredient.copper_ingot: 1, Ingredient.magnet: 2},
    Ingredient.magnetic_coil,
    2,
    1,
    Building.assembler,
)
steel_recipe = Recipe(
    {Ingredient.iron_ingot: 3}, Ingredient.steel, 1, 3, Building.smelter
)
gear_recipe = Recipe(
    {Ingredient.iron_ingot: 1}, Ingredient.gear, 1, 1, Building.assembler
)
circuit_board_recipe = Recipe(
    {Ingredient.copper_ingot: 1, Ingredient.iron_ingot: 2},
    Ingredient.circuit_board,
    2,
    1,
    Building.assembler,
)
electric_motor_recipe = Recipe(
    {Ingredient.iron_ingot: 2, Ingredient.magnetic_coil: 1, Ingredient.gear: 1},
    Ingredient.electric_motor,
    1,
    2,
    Building.assembler,
)
electromagnetic_turbine_recipe = Recipe(
    {Ingredient.electric_motor: 2, Ingredient.magnetic_coil: 2},
    Ingredient.electromagnetic_turbine,
    1,
    2,
    Building.assembler,
)

recipes = {
    Ingredient.iron_ingot: Recipe(
        {Ingredient.iron_ore: 1}, Ingredient.iron_ingot, 1, 1, Building.smelter
    ),
    Ingredient.copper_ingot: Recipe(
        {Ingredient.copper_ore: 1}, Ingredient.copper_ingot, 1, 1, Building.smelter
    ),
    Ingredient.magnet: Recipe(
        {Ingredient.iron_ore: 1}, Ingredient.magnet, 1, 1.5, Building.smelter
    ),
    Ingredient.magnetic_coil: magnetic_coil_recipe,
    Ingredient.gear: gear_recipe,
    Ingredient.electric_motor: electric_motor_recipe,
    Ingredient.electromagnetic_turbine: electromagnetic_turbine_recipe,
    Ingredient.steel: steel_recipe,
    Ingredient.stone_brick: Recipe(
        {Ingredient.stone: 1}, Ingredient.stone_brick, 1, 1, Building.smelter
    ),
    Ingredient.circuit_board: circuit_board_recipe,
    Ingredient.graphite: Recipe(
        {Ingredient.coal: 2}, Ingredient.graphite, 1, 2, Building.smelter
    ),
}


def get_factory(output: dict[Ingredient, int]):
    base_resources = [ing for ing in Ingredient if ing not in recipes]

    @lru_cache
    def get_complexity(ingr: Ingredient):
        if ingr in base_resources:
            return 0
        recipe = recipes[ingr]
        return 1 + max(get_complexity(i) for i in recipe.inputs)

    max_complexity = 0

    for ingr, rec in recipes.items():
        com = get_complexity(ingr)
        max_complexity = max(max_complexity, com)
        rec.complexity = com

    required_ingredients: dict[Ingredient, float] = {ingr: 0 for ingr in recipes}
    required_ingredients.update({base: 0 for base in base_resources})

    for ingr, amount in output.items():
        required_ingredients[ingr] += amount

    required_machines: dict[Ingredient, int] = {}

    for com in range(max_complexity, -1, -1):
        for ingr, rec in recipes.items():
            if rec.complexity != com:
                continue

            number = ceil(required_ingredients[ingr] / rec.ops())
            if number > 0:
                required_machines[ingr] = number

            for inp in rec.inputs:
                amount = rec.inputs[inp] / rec.time
                required_ingredients[inp] += amount * number

    for ingr, num in required_machines.items():
        rec = recipes[ingr]
        input = ", ".join(
            [
                f"{amount / rec.time * num * 60} {inp.name}"
                for inp, amount in rec.inputs.items()
            ]
        )
        print(
            f"{num} {rec.building.name} creating {rec.ops() * num * 60} {rec.output_type.name} per minute from {input}"
        )


get_factory({Ingredient.electromagnetic_turbine: 0.1})
