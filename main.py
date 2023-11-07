from dataclasses import dataclass
from functools import lru_cache
from math import ceil
from typing import Optional
import luadata  # type: ignore


@dataclass
class Item:
    id: int
    name: str
    complexity = -1


IRON_INGOT = 1101
MAGNET = 1102
STEEL = 1103
COPPER_INGOT = 1104
HIGH_PURITY_SILICON = 1105
TITANIUM_INGOT = 1106
TITANIUM_ALLOY = 1107
STONE_BRICK = 1108
ENERGETIC_GRAPHITE = 1109
GLASS = 1110
PRISM = 1111
DIAMOND = 1112
CHRYSTAL_SILICON = 1113
REFINED_OIL = 1114
PLASTIC = 1115
SULFURIC_ACID = 1116
ORGANIC_CRYSTAL = 1117
TITANIUM_CHRYSTAL = 1118
TITANIUM_GLASS = 1119
HYDROGEN = 1120
DEUTERIUM = 1121
GRAPHENE = 1123
CARBON_NANOTUBE = 1124
FRAME_MATERIAL = 1125
CASIMIR_CRYSTAL = 1126
STRANGE_MATTER = 1127
FOUNDATION = 1131
GEAR = 1201
MAGNETIC_COIL = 1202
ELECTRIC_MOTOR = 1203
ELECTROMAGNETIC_TURBINE = 1204
SUPERMAGNETIC_RING = 1205
PARTICLE_CONTAINER = 1206
GRAVITON_LENS = 1209
SPACE_WARPER = 1210
CIRCUIT_BOARD = 1301
MICROCRYSTALLINE_COMPONENT = 1302
PROCESSOR = 1303
PLANE_FILTER = 1304
QUANTUM_CHIP = 1305
PLASMA_EXCITER = 1401
PARTICLE_BROADBAND = 1402
PHOTON_COMBINER = 1404
THRUSTER = 1405
REINFORCED_THRUSTER = 1406
SOLAR_SAIL = 1501
DYSON_SPHERE_COMPONENT = 1502
SMALL_CARRIER_ROCKET = 1503
DEUTERON_FUEL_ROD = 1802
BELT_1 = 2001
BELT_2 = 2002
BELT_3 = 2003
SORTER_1 = 2011
SORTER_2 = 2012
SORTER_3 = 2013
SPLITTER = 2020
PILER = 2040
STORAGE_2 = 2102
PLANETARY_LOGISTICS_STATION = 2103
INTERSTELLAR_LOGISTICS_STATION = 2104
ORBITAL_COLLECTOR = 2105
LOGISTICS_DISTRIBUTOR = 2107
TESLA_TOWER = 2201
SOLAR_PANEL = 2205
ACCUMULATOR = 2206
RAY_RECEIVER = 2208
MINING_MACHINE = 2301
SMELTER = 2302
ASSEMBLER_1 = 2303
ASSEMBLER_2 = 2304
ASSEMBLER_3 = 2305
WATER_PUMP = 2306
OIL_EXTRACTOR = 2307
OIL_REFINER = 2308
CHEMICAL_PLANT = 2309
PARTICLE_COLLIDER = 2310
SPRAY_COATER = 2313
FRACTIONATOR = 2314
DRONE = 5001
VESSEL = 5002
BOT = 5003
SCIENCE_1 = 6001
SCIENCE_2 = 6002
SCIENCE_3 = 6003
SCIENCE_4 = 6004
SCIENCE_5 = 6005
SCIENCE_6 = 6006


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
                f"{round(amount * num * 60)} {get_item(inp).name}"
                for inp, amount in self.inputs.items()
            ]
        )
        output_string = ", ".join(
            [
                f"{round(amount * num * 60)} {get_item(out).name}"
                for out, amount in self.outputs.items()
            ]
        )
        return f"{round(num, 2)} {self.type.lower()} creating {output_string} per minute from {input_string}"


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


@lru_cache
def get_default_recipe(item_id: int) -> Optional[Recipe]:
    # Some manual overrides:
    if item_id == 1109:  # Energetic Graphite
        return get_recipe_from_id(17)

    if item_id == 1114:  # Refined Oil
        return get_recipe_from_id(16)

    if item_id == 1117:  # Organic Chrystal
        return get_recipe_from_id(25)

    if item_id == 1120:  # Hydrogen
        return get_recipe_from_id(16)

    if item_id == 1105:  # Silicon
        return get_recipe_from_id(59)

    if item_id == 1113:  # Silicon Crystal
        return get_recipe_from_id(37)

    if item_id == 1123:  # Graphene
        return get_recipe_from_id(32)

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
        assert rec is not None
        required_items[item_id] += amount * rec.outputs[item_id]

    required_recipes: dict[int, float] = {}

    for com in range(max_complexity, 0, -1):
        for item in items:
            if item.complexity != com:
                continue

            if item.id in provided:
                continue

            rec = get_default_recipe(item.id)
            assert rec is not None
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
            print(f"Input {round(amount * 60)} {item.name} ")
        if amount < 0:
            item = get_item(item_id)
            print(f"Excess {-round(amount * 60)} {item.name}")


# Electromagnetic Turbine
# print("\nElectromagnetic Turbine")
# get_factory({1204: 1}, [])

# Plasma Exciter
# print("\nPlasma Exciter")
# get_factory({1401: 0.5, 1111: 0.5}, [], False)

# Processor
# print("\nProcessor")
# get_factory({1303: 3}, [])


# Science
# print("\nScience Blue")
# get_factory({6001: 6}, [])
# print("\nScience Red")
# get_factory({6002: 3}, [])
# print("\nScience Yellow")
# get_factory({6003: 7}, [1106])
# print("\nScience Purple")
# get_factory({6004: 3.9}, [1303, 1113])

# Solar Panel
# print("\nSolar Panel")
# get_factory({2205: 1}, [])

# Solar Sail
# print("\nSolar Sail")
# get_factory({1501: 3}, [1301])

# Proliferator
# print("\nProliferator")
# get_factory({1142: 1}, [])

# Graphene
# print("\nGraphene")
# get_factory({1123: 1}, [])

# Titanium Alloy
# print("\nTitanium Alloy")
# get_factory({1107: 1}, [])


# Solar Panels
# print("\nSolar Panels")
# get_factory({2206: 0.5}, [], False)

# dwget_factory({1205: 0.75}, [], False)

# get_factory({1107: 4}, [1106], False)

# print("")

# get_factory({1802: 4}, [1305, 1120, 1205, 1106, 1205, 1107], False)

# print("")

# get_factory({1503: 0.5}, [1802,1305, 1120, 1303, 1106, 1205, 1404, 1105, 1107], False)

# get_factory({1209: 0.75}, [1120], False)

# get_factory({1402: 4}, [], False)

# Basic buildings: Tesla tower, Belt, Sorter, Splitter, Miner, Assembler,
print("\nBuildings")
get_factory(
    output={
        TESLA_TOWER: 0.1,
        BELT_1: 0.1,
        BELT_2: 0.1,
        SORTER_1: 0.1,
        SORTER_2: 0.1,
        SPLITTER: 0.01,
        STORAGE_2: 0.1,
        LOGISTICS_DISTRIBUTOR: 0.1,
        INTERSTELLAR_LOGISTICS_STATION: 0.01,
        MINING_MACHINE: 0.1,
        SMELTER: 0.1,
        ASSEMBLER_2: 0.1,
        OIL_EXTRACTOR: 0.01,
        OIL_REFINER: 0.01,
        CHEMICAL_PLANT: 0.1,
        FOUNDATION: 0.1,
        FRACTIONATOR: 0.01,
        DRONE: 0.1,
        VESSEL: 0.1,
        BOT: 0.1,
    },
    provided=[
        IRON_INGOT,
        MAGNET,
        COPPER_INGOT,
        HIGH_PURITY_SILICON,
        TITANIUM_INGOT,
        STONE_BRICK,
        GLASS,
        SULFURIC_ACID,
        GRAPHENE,
    ],
    excess=False,
)
