items = {
    [1000] = {
        name='Water',
        type='RESOURCE',
        grid_index=1107,
        stack_size=20,
        is_fluid=true,
        unlock_key=2306,
        mining_from='Ocean',
        description='It can be obtained from a water pump and widely used in chemical production.',
        --image='water'
    },
    [1001] = {
        name='Iron Ore',
        type='RESOURCE',
        grid_index=1101,
        stack_size=100,
        unlock_key=-1,
        mining_from='Iron Veins',
        description='Used to smelt iron ingots and magnets. Obtained by gathering iron vein.<br>',
        --image='iron-ore'
    },
    [1002] = {
        name='Copper Ore',
        type='RESOURCE',
        grid_index=1102,
        stack_size=100,
        unlock_key=-1,
        mining_from='Copper Veins',
        description='Smelted directly into copper ingots. Obtained by gathering copper vein. ',
        --image='copper-ore'
    },
    [1003] = {
        name='Silicon Ore',
        type='RESOURCE',
        grid_index=1105,
        stack_size=100,
        unlock_key=6001,
        mining_from='Silicon Veins',
        description='Obtained by gathering from silicon veins. It is usually used to make high-purity silicon crystals.',
        --image='silicium-ore'
    },
    [1004] = {
        name='Titanium Ore',
        type='RESOURCE',
        grid_index=1106,
        stack_size=100,
        unlock_key=6002,
        mining_from='Titanium Veins',
        description='Can form under the action of high-intensity heat with a  particular molecular structure.',
        --image='titanium-ore'
    },
    [1005] = {
        name='Stone',
        type='RESOURCE',
        grid_index=1103,
        stack_size=100,
        unlock_key=-1,
        mining_from='Stone Veins',
        description='A common ore. It is a raw material which can be also obtained from rocks.',
        --image='stone-ore'
    },
    [1006] = {
        name='Coal',
        type='RESOURCE',
        grid_index=1104,
        stack_size=100,
        energy=2700000,
        fuel_chamber_boost=0.0,
        unlock_key=-1,
        mining_from='Coal Veins',
        description="A solid combustible mineral. It's gradually formed by plants through complex biochemical, physical and chemical changes. It is raw material for smelting and chemical production as well as an energy source.",
        --image='coal-ore'
    },
    [1007] = {
        name='Crude Oil',
        type='RESOURCE',
        grid_index=1108,
        stack_size=20,
        is_fluid=true,
        energy=4050000,
        fuel_chamber_boost=0.2,
        unlock_key=2307,
        mining_from='Crude Oil Seep',
        description='Fossil formed by marine organisms can gather as a liquid mineral deposit. It contains the chemical energy marine organisms accumulated during their lifetime. Can as fuel or chemical raw material.<br>',
        --image='oil'
    },
    [1011] = {
        name='Fire Ice',
        type='RESOURCE',
        grid_index=1307,
        stack_size=50,
        energy=4800000,
        fuel_chamber_boost=0.4,
        unlock_key=1120,
        mining_from='Fire ice vein <span style="color:#FFFFFFC1">(rare)</span>',
        description='Rare ore. Has cage-like microstructure which is similar to ice-like white solid, and covalent bonds in a critical state allow it to be used to produce graphene more efficiently.',
        --image='gas-hydrate'
    },
    [1012] = {
        name='Kimberlite Ore',
        type='RESOURCE',
        grid_index=1112,
        stack_size=50,
        unlock_key=1112,
        mining_from='Kimberlite vein <span style="color:#B9DFFFC4">(rare)</span>',
        description='Rare ore. Directly crystallized from Kimberlite magma under CO₂ rich conditions, and diamond can be obtained by further smelting.',
        --image='diamond-ore'
    },
    [1013] = {
        name='Fractal Silicon',
        type='RESOURCE',
        grid_index=1212,
        stack_size=50,
        unlock_key=1105,
        mining_from='Fractal silicium vein <span style="color:#43FF89D4">(rare)</span>',
        description='It is a rare natural silicon ore with a unique geometric fractal structure. After the single crystal grows to a certain size, the branches of smaller silicon crystals grow from the matrix. Crystal fractal is a natural purification mechanism. The more fractal algebra, the higher the purity. Among them, fractal silicon with more than six generations can directly be used as the raw material for making lattice silicon.',
        --image='fractal-silica'
    },
    [1014] = {
        name='Optical Grating Crystal',
        type='RESOURCE',
        grid_index=1312,
        stack_size=50,
        unlock_key=6002,
        mining_from='Optical grating crystal vein <span style="color:#E37AFFDA">(rare)</span>',
        description='Rare ore. With naturally formed grooves distributed on the surface, is used to produce precision optical components and high-power exciters.',
        --image='grating-ore'
    },
    [1015] = {
        name='Spiniform Stalagmite Crystal',
        type='RESOURCE',
        grid_index=1412,
        stack_size=50,
        unlock_key=6002,
        mining_from='Spiniform stalagmite crystal vein <span style="color:#7AF0FFC8">(rare)</span>',
        description='It will only be a rare occurrence on the living planet that once existed widely in the ocean with a depth of 100,000 meters. After the marine life on these planets die, and the corpse sinks to the bottom of the sea, it can directly mineralize with seawater under the deep sea high pressure. If there is a stable, smooth, slow, and hot ocean current at this time, spiniform stalagmite crystal may form under the blow of the ocean current.',
        --image='bamboo-crystal'
    },
    [1016] = {
        name='Unipolar Magnet',
        type='RESOURCE',
        grid_index=1512,
        stack_size=50,
        unlock_key=1206,
        mining_from='Unipolar magnet vein <span style="color:#FFA086C8">(rare)</span>',
        description="Rare ore, Has a pyrochlore lattice. After applying a magnetic field, we can affect the string's symmetry and direction, reduce the string network's density, and separating magnetic monopoles.",
        --image='mono-mag-ore'
    },
    [1030] = {
        name='Log',
        type='RESOURCE',
        grid_index=1612,
        stack_size=100,
        energy=1500000,
        fuel_chamber_boost=-0.1,
        unlock_key=-1,
        mining_from='Tree',
        description='Ordinary fuel. Obtained from trees, has low energy.',
        --image='wood'
    },
    [1031] = {
        name='Plant Fuel',
        type='RESOURCE',
        grid_index=1712,
        stack_size=500,
        energy=500000,
        fuel_chamber_boost=-0.3,
        unlock_key=-1,
        mining_from='Plant',
        description='Compared with wood, although the energy is lower, it is easier to obtain.',
        --image='plant-fuel'
    },
    [1101] = {
        name='Iron Ingot',
        type='MATERIAL',
        grid_index=1201,
        stack_size=100,
        description='Basic raw material. Used to produce various iron components.',
        --image='iron-plate'
    },
    [1102] = {
        name='Magnet',
        type='MATERIAL',
        grid_index=1301,
        stack_size=200,
        description='Basic magnetic material. Obtained by smelting iron ore directly.',
        --image='magnet'
    },
    [1103] = {
        name='Steel',
        type='MATERIAL',
        grid_index=1401,
        stack_size=100,
        description='Under strict and controllable temperature conditions, using iron ingots as raw material for further smelting, the crystal form of the material is improved so that it has better mechanical properties.',
        --image='steel-plate'
    },
    [1104] = {
        name='Copper Ingot',
        type='MATERIAL',
        grid_index=1202,
        stack_size=100,
        description='Basic raw material. Used to produce various copper components.',
        --image='copper-plate'
    },
    [1105] = {
        name='High-Purity Silicon',
        type='MATERIAL',
        grid_index=1205,
        stack_size=100,
        description='After the crude silicon is melted and recrystallized, it can obtain analytically pure silicon crystals. The photovoltaic materials and semiconductor components made can fit a variety of needs.',
        --image='silicium-single-crystal'
    },
    [1106] = {
        name='Titanium Ingot',
        type='MATERIAL',
        grid_index=1206,
        stack_size=100,
        description='Obtained from smelting titanium ores, it is light in weight and high in strength. It is an indispensable raw material for producing high-strength materials.',
        --image='titanium-plate'
    },
    [1107] = {
        name='Titanium Alloy',
        type='MATERIAL',
        grid_index=1306,
        stack_size=100,
        description="Under different temperatures, utilizing the characteristics of the titanium's lattice structure and adding precise proportions of alloying elements will produce a new type of alloy material that achieves a perfect balance of phase transition temperature and phase content. It has superior strength and toughness.",
        --image='titanium-alloy'
    },
    [1108] = {
        name='Stone Brick',
        type='MATERIAL',
        grid_index=1203,
        stack_size=100,
        description='A common material. Obtained from smelting stone ores, is usually used as a foundation for facilities.',
        --image='stone-brick'
    },
    [1109] = {
        name='Energetic Graphite',
        type='MATERIAL',
        grid_index=1204,
        stack_size=100,
        energy=6750000,
        fuel_chamber_boost=0.5,
        explicit_tech_dep=1402,
        description='Purify raw coal to obtain graphite, a more usable form of carbon. You can further compact graphite to create crystal diamonds that have more advanced applications.',
        --image='graphite'
    },
    [1110] = {
        name='Glass',
        type='MATERIAL',
        grid_index=1303,
        stack_size=100,
        description='An amorphous optical medium material with an irregular structure, can be used to make various optical components such as prisms and lenses. And can also be used to make facilities and buildings.',
        --image='glass'
    },
    [1111] = {
        name='Prism',
        type='MATERIAL',
        grid_index=1403,
        stack_size=100,
        description='A polyhedron surrounded by two intersecting glass planes, can split light or disperse light beams. It is a key component for producing more precise optical instruments.',
        --image='prism'
    },
    [1112] = {
        name='Diamond',
        type='MATERIAL',
        grid_index=1304,
        stack_size=100,
        energy=900000,
        fuel_chamber_boost=-0.5,
        description='Diamond is obtained by using strong pressure and heat to change the structure of graphite. It is a very hard crystal that not only retains the parallel hexagonal lattice of graphite but also forms a cubic hexagonal lattice. ',
        --image='diamond'
    },
    [1113] = {
        name='Crystal Silicon',
        type='MATERIAL',
        grid_index=1305,
        stack_size=100,
        explicit_tech_dep=1403,
        description='Obtain a spectrally pure silicon crystal after the High-purity silicon is melted and passed through a strong electric field at a certain speed, which can further remove the ionic impurities dissolved therein. Crystal silicon has almost no crystal defects and is mainly used to make some ultra-high-precision optical instruments.',
        --image='silicium-high-purity'
    },
    [1114] = {
        name='Refined Oil',
        type='MATERIAL',
        grid_index=1208,
        stack_size=20,
        is_fluid=true,
        energy=4500000,
        fuel_chamber_boost=0.3,
        description='The primary product of crude oil refining. A chemical fuel, can be used to produce various chemical products.',
        --image='refined-oil'
    },
    [1115] = {
        name='Plastic',
        type='MATERIAL',
        grid_index=1308,
        stack_size=100,
        description='Primary chemical product. Has a wide range of uses and is usually used to make more advanced chemical products.',
        --image='plastic'
    },
    [1116] = {
        name='Sulfuric Acid',
        type='MATERIAL',
        grid_index=1207,
        stack_size=20,
        is_fluid=true,
        mining_from='Sulfuric acid ocean',
        description='Primary chemical product. Produced from crude oil, can also be directly gathered from the sea of sulfuric acid with a water pump.',
        --image='sulphuric-acid'
    },
    [1117] = {
        name='Organic Crystal',
        type='MATERIAL',
        grid_index=1309,
        stack_size=100,
        energy=1800000,
        fuel_chamber_boost=-0.2,
        mining_from='Organic crystal vein <span style="color:#F5FF4FC1">(rare)</span>',
        description='A high-grade chemical product. Used to produce higher strength crystals with a crystal structure. It can also be directly gathered from rare organic crystal vein.',
        --image='crystal-rubber'
    },
    [1118] = {
        name='Titanium Crystal',
        type='MATERIAL',
        grid_index=1409,
        stack_size=100,
        description='Further, strengthen the lattice structure of titanium to form particular titanium atom crystal with higher strength by adding a precise proportion of organic crystals to titanium. ',
        --image='titan-crystal'
    },
    [1119] = {
        name='Titanium Glass',
        type='MATERIAL',
        grid_index=1609,
        stack_size=100,
        description='When the glass is in a molten state, adding a certain proportion of titanium can greatly strengthen the glass and adapt to more intense environments.',
        --image='titan-glass'
    },
    [1120] = {
        name='Hydrogen',
        type='MATERIAL',
        grid_index=1109,
        stack_size=20,
        is_fluid=true,
        energy=9000000,
        fuel_chamber_boost=1.0,
        explicit_tech_dep=1102,
        mining_from='Gas Giant Orbit',
        description='The most abundant element in the universe is the lightest gas.',
        --image='hydrogen'
    },
    [1121] = {
        name='Deuterium',
        type='MATERIAL',
        grid_index=1110,
        stack_size=20,
        is_fluid=true,
        energy=9000000,
        fuel_chamber_boost=1.0,
        unlock_key=1120,
        explicit_tech_dep=1134,
        mining_from='Gas Giant Orbit',
        description='A stable isotope of hydrogen. Rarely exists under natural conditions. Most of them come from the reprocessing of hydrogen and the collection from the Gas giant.',
        --image='deuterium'
    },
    [1122] = {
        name='Antimatter',
        type='MATERIAL',
        grid_index=1111,
        stack_size=20,
        description='It is obtained by inverting photons in a critical state. When the positive and antimatter meet, they will annihilate each other and generate huge energy.',
        --image='anti-matter'
    },
    [1123] = {
        name='Graphene',
        type='MATERIAL',
        grid_index=1310,
        stack_size=100,
        energy=96000,
        fuel_chamber_boost=-0.7,
        description='The double-layer graphenes will form a complex repeating structure, a superlattice by rotating when stacking one layer of graphene on top of another. After rotating to a certain Magic Angle, double-layered graphene will gain superconductive properties. Graphene has become a new type of nano-superconducting material.',
        --image='graphene'
    },
    [1124] = {
        name='Carbon Nanotube',
        type='MATERIAL',
        grid_index=1410,
        stack_size=100,
        energy=84000,
        fuel_chamber_boost=-0.8,
        description='The weight is very light with a perfectly connected hexagonal structure, has extremely high strength and strong resistance to deformation, and is usually used to manufacture high-efficiency devices.',
        --image='nanotube'
    },
    [1125] = {
        name='Frame Material',
        type='MATERIAL',
        grid_index=1709,
        stack_size=100,
        description='A new type of high-strength lightweight structure. Can withstand the strong gravitational force of stars compared with traditional structural materials, and is very suitable for manufacturing Dyson sphere components.',
        --image='frame-material'
    },
    [1126] = {
        name='Casimir Crystal',
        type='MATERIAL',
        grid_index=1407,
        stack_size=100,
        description='Use a strong electric field to fix the charged particles, and the Coulomb repulsion between the particles will spontaneously form a spatial ring-shaped ion crystal. After applying a weak static magnetic field, the zero-point energy of the particles inside the crystal is excited, producing an obvious Casimir effect.',
        --image='casimir-crystal'
    },
    [1127] = {
        name='Strange Matter',
        type='MATERIAL',
        grid_index=1408,
        stack_size=100,
        description='Strange matter has a great gravitational negative pressure, which exceeds its energy density, so that the space around the strange matter is warped and meets the negative energy demand of the warp engine.',
        --image='strange-matter-generator'
    },
    [1131] = {
        name='Foundation',
        type='COMPONENT',
        grid_index=1601,
        stack_size=1000,
        can_build=true,
        build_index=901,
        description='A surface leveling tool. Cannot use it to change the planetary landforms at will, can only level the surface to zero altitude. If you use the foundation for high ground, you will get soil pile; on the contrary, if you use the foundation for the ocean or low-lying areas, you must consume soil pile. When laying the foundation, you can choose a kind of decoration, or without decoration, only level the surface.',
        --image='terrain-tool'
    },
    [1141] = {
        name='Proliferator Mk.I',
        type='MATERIAL',
        grid_index=1406,
        stack_size=200,
        description='Input the Proliferator into the Spray Coater from the conveyor belt port above the Spray Coater and it will be sprayed on the cargos. When the sprayed cargos are used as raw materials to produce the next-level products, it can obtain Extra Products or Production Speedup, it will also increase the power consumption.',
        --image='accelerator-1'
    },
    [1142] = {
        name='Proliferator Mk.II',
        type='MATERIAL',
        grid_index=1506,
        stack_size=200,
        description='Comparing with Proliferator MK.I, Proliferator MK.II upgraded the raw material formula. If you spray it on the cargos, when the sprayed cargos are used as raw materials to produce the next-level products, the effect of Extra Products or Production Speedup will be improved.',
        --image='accelerator-2'
    },
    [1143] = {
        name='Proliferator Mk.III',
        type='MATERIAL',
        grid_index=1606,
        stack_size=200,
        description='The raw material formula of the Proliferator has been furtherly upgraded. When the sprayed cargos are used as raw materials to produce the next-level products, it can maximize the effect of Extra Products or Production Speedup. The power consumption will also be greatly increased, and the requirements for the entire production line will be higher. ',
        --image='accelerator-3'
    },
    [1201] = {
        name='Gear',
        type='COMPONENT',
        grid_index=1501,
        stack_size=200,
        description='Standard component is used for transmission and other functions and is also widely used in various mechanical structures.',
        --image='gear-wheel'
    },
    [1202] = {
        name='Magnetic Coil',
        type='COMPONENT',
        grid_index=1302,
        stack_size=200,
        description='The most basic electromagnetic component. It is very functional.',
        --image='magnetism-wire'
    },
    [1203] = {
        name='Electric Motor',
        type='COMPONENT',
        grid_index=1404,
        stack_size=100,
        description='The fundamental power system component. It can accelerate mechanical operation.',
        --image='electric-motor'
    },
    [1204] = {
        name='Electromagnetic Turbine',
        type='COMPONENT',
        grid_index=1504,
        stack_size=100,
        description='Make objects levitate against gravity, usually used to make more advanced magnetic field generators.',
        --image='mag-turbine'
    },
    [1205] = {
        name='Super-Magnetic Ring',
        type='COMPONENT',
        grid_index=1604,
        stack_size=100,
        description='Super magnetic field generating device. Generated super-strong magnetic field can directly act on the atomic scale, causing the distortion of the material lattice, thereby preparing high-performance materials and devices.',
        --image='hyper-magnetism-ring'
    },
    [1206] = {
        name='Particle Container',
        type='COMPONENT',
        grid_index=1603,
        stack_size=100,
        description='While firmly binding the particles, it can guide particles to show some specific properties.',
        --image='partical-capacitor'
    },
    [1208] = {
        name='Critical Photon',
        type='MATERIAL',
        grid_index=1602,
        stack_size=100,
        unlock_key=1122,
        explicit_tech_dep=1506,
        explicit_produce_from='Ray Receiver',
        description='A critical state photon. Can be converted into antimatter and hydrogen under the action of a super magnetic field.',
        --image='photon-capacitor-full'
    },
    [1209] = {
        name='Graviton Lens',
        type='COMPONENT',
        grid_index=1605,
        stack_size=100,
        description='A piece of neutron star material that has been encapsulated after processing, its twisted and powerful gravitational field is shielded in a container. Usually, we will use it to process and change the spatial structure, but we can expect some one use it to refract the sunlight and ignite fire.',
        --image='gravity-lens'
    },
    [1210] = {
        name='Space Warper',
        type='COMPONENT',
        grid_index=1608,
        stack_size=100,
        explicit_tech_dep=1704,
        description='Consumables. Used to activate warp of mecha and logistics vessels.<br>Use the <span style="color:#FD965ECC">CapsLock</span> key to start the warp engine.',
        --image='space-warper'
    },
    [1301] = {
        name='Circuit Board',
        type='COMPONENT',
        grid_index=1402,
        stack_size=200,
        description='The most basic electrical component. It is very versatile.',
        --image='circuit-board'
    },
    [1302] = {
        name='Microcrystalline Component',
        type='COMPONENT',
        grid_index=1405,
        stack_size=200,
        description='Microcrystalline component is the basis for processors to achieve high-speed computing functions. It requires carving and processing city-like three-dimensional nanostructures on high-purity silicon wafers to make.',
        --image='micro-component'
    },
    [1303] = {
        name='Processor',
        type='COMPONENT',
        grid_index=1505,
        stack_size=200,
        description='Large-scale integrated circuit device. The application of semiconductor materials make it better in processing data and controlling the processing process.',
        --image='processor'
    },
    [1304] = {
        name='Plane Filter',
        type='COMPONENT',
        grid_index=1610,
        stack_size=200,
        description='Studying the Rabi oscillation to obtain the law of the probability change with time during the evolution of the particle wave function over time, it can be artificially interfered with during the quantum transition so that the quantum jumps in the expected direction.',
        --image='plane-filter'
    },
    [1305] = {
        name='Quantum Chip',
        type='COMPONENT',
        grid_index=1611,
        stack_size=200,
        description='With powerful computing power and ultra-fast computing speed, it can warn whether the quantum transition will cause errors. And timely prevent its transition by reversing the transition process that may cause errors.',
        --image='quantum-processor'
    },
    [1401] = {
        name='Plasma Exciter',
        type='COMPONENT',
        grid_index=1502,
        stack_size=200,
        description='The plasma generated by the high-power exciter can be used to extract and refine crude oil, and can also be used to make wireless power tower for remote power transmission and charge mecha.',
        --image='plasma-generator'
    },
    [1402] = {
        name='Particle Broadband',
        type='COMPONENT',
        grid_index=1411,
        stack_size=200,
        description='Control the particles to maintain a certain regularity, which greatly improves the printing speed of the particles.',
        --image='particle-wide-band'
    },
    [1403] = {
        name='Annihilation Constraint Sphere',
        type='COMPONENT',
        grid_index=1311,
        stack_size=20,
        description='It is a crucial component of artificial stars to confine the annihilation reaction within the sphere to obtain stable and controllable energy output.',
        --image='fusion-capacitor'
    },
    [1404] = {
        name='Photon Combiner',
        type='COMPONENT',
        grid_index=1503,
        stack_size=200,
        description='The surface of the prism is cut into nano-gratings and then reassembled. After continuously absorbing multiple low-energy photons will emit a high-energy photon under a combination of specific structures. The magic is that the natural Optical grating crystal in the cluster can directly do this.',
        --image='photo-shifter'
    },
    [1405] = {
        name='Thruster',
        type='COMPONENT',
        grid_index=1507,
        stack_size=200,
        description='Can provide power for logistics drone.',
        --image='fuel-thruster'
    },
    [1406] = {
        name='Reinforced Thruster',
        type='COMPONENT',
        grid_index=1508,
        stack_size=100,
        description='It is an upgraded version of the thruster that can power the logistics vessel.',
        --image='ion-thruster'
    },
    [1501] = {
        name='Solar Sail',
        type='PRODUCT',
        grid_index=1708,
        stack_size=200,
        description='Use the EM-Rail Ejector to launch a large number of solar sails to form Dyson swarm, which can more effectively obtain the radiant energy of stars.',
        --image='solar-collector'
    },
    [1502] = {
        name='Dyson Sphere Component',
        type='COMPONENT',
        grid_index=1710,
        stack_size=100,
        description='Use a small carrier rocket to transport them to the planned Dyson sphere to form the nodes and frames of the Dyson sphere.',
        --image='dyson-sphere-component'
    },
    [1503] = {
        name='Small Carrier Rocket',
        type='PRODUCT',
        grid_index=1711,
        stack_size=20,
        description='The delivery vehicle of Dyson sphere components. If you want to speed up the construction, you need to send more rockets.',
        --image='rocket'
    },
    [1801] = {
        name='Hydrogen Fuel Rod',
        type='PRODUCT',
        grid_index=1209,
        stack_size=30,
        energy=54000000,
        fuel_chamber_boost=2.0,
        description="With further development of cryo-technology hydrogen can be liquefied to make fuel rods for higher combustion efficiency. These higher energy Fuel Rods can greatly increase the mecha's fuel power generation.",
        --image='hydrogen-energy-fuel'
    },
    [1802] = {
        name='Deuteron Fuel Rod',
        type='PRODUCT',
        grid_index=1210,
        stack_size=30,
        energy=600000000,
        fuel_chamber_boost=3.0,
        description='Under a magnetic field, it is possible to make deuterium into deuteron fuel rods as a better source of energy. These fuel rods are often used in small fusion systems.',
        --image='deuterium-energy-fuel'
    },
    [1803] = {
        name='Antimatter Fuel Rod',
        type='PRODUCT',
        grid_index=1211,
        stack_size=30,
        energy=7200000000,
        fuel_chamber_boost=5.0,
        description='Antimatter can be made into a more stable fuel rod by using the strong restraint of annihilation constraint sphere. It will be safer in this way.',
        --image='antimatter-energy-fuel'
    },
    [2001] = {
        name='Conveyor Belt MK.I',
        type='LOGISTICS',
        grid_index=2201,
        stack_size=300,
        sub_id=1,
        can_build=true,
        build_index=301,
        description='We need automation! Conveyor belts are the most basic part of production automation. They can transport cargo from one place to another.',
        --image='belt-1'
    },
    [2002] = {
        name='Conveyor Belt MK.II',
        type='LOGISTICS',
        grid_index=2202,
        stack_size=300,
        sub_id=2,
        can_build=true,
        build_index=302,
        description='An upgraded conveyor belt, with higher speed and consequently higher throughput.',
        --image='belt-2'
    },
    [2003] = {
        name='Conveyor Belt MK.III',
        type='LOGISTICS',
        grid_index=2203,
        stack_size=300,
        sub_id=3,
        can_build=true,
        build_index=303,
        description='Maximize the speed and throughput of transporting cargo.',
        --image='belt-3'
    },
    [2011] = {
        name='Sorter MK.I',
        type='LOGISTICS',
        grid_index=2301,
        stack_size=200,
        sub_id=1,
        can_build=true,
        build_index=304,
        description='Transport cargo from conveyor belts into facilities or between facilities, can install filter to filter the cargo.',
        --image='inserter-1'
    },
    [2012] = {
        name='Sorter MK.II',
        type='LOGISTICS',
        grid_index=2302,
        stack_size=200,
        sub_id=2,
        can_build=true,
        build_index=305,
        description='Can sort cargo more quickly.',
        --image='inserter-2'
    },
    [2013] = {
        name='Sorter MK.III',
        type='LOGISTICS',
        grid_index=2303,
        stack_size=200,
        sub_id=3,
        can_build=true,
        build_index=306,
        description='In order to maximize the speed of sorting cargo, we can upgrade technology to increase the number of cargo that can be transported by the sorter MK.III each time.',
        --image='inserter-3'
    },
    [2020] = {
        name='Splitter',
        type='LOGISTICS',
        grid_index=2204,
        stack_size=50,
        can_build=true,
        build_index=307,
        description='Used to distribute cargo to different conveyor belts, or to balance multiple conveyor belts. Can set the filter and priority on any one port.',
        --image='splitter-4dir'
    },
    [2030] = {
        name='Traffic Monitor',
        type='LOGISTICS',
        grid_index=2304,
        stack_size=100,
        can_build=true,
        build_index=309,
        description='The Traffic Monitor is built on the conveyor belt to monitor the real-time cargo flow rate at the corresponding location. Conditions can be set to trigger an alarm.',
        --image='monitor'
    },
    [2040] = {
        name='Automatic Piler',
        type='LOGISTICS',
        grid_index=2205,
        stack_size=50,
        can_build=true,
        build_index=308,
        description='After setting up the Automatic Piler on the conveyor belt, it can automatically integrate two consecutive cargos into one, which greatly improves the carrying capacity of the conveyor belt.',
        --image='piler'
    },
    [2101] = {
        name='Storage MK.I',
        type='LOGISTICS',
        grid_index=2206,
        stack_size=50,
        sub_id=1,
        can_build=true,
        build_index=401,
        description='Used to store products, but the capacity is limited.',
        --image='storage-1'
    },
    [2102] = {
        name='Storage MK.II',
        type='LOGISTICS',
        grid_index=2207,
        stack_size=50,
        sub_id=2,
        can_build=true,
        build_index=402,
        description='Has twice the capacity of a Storage Mk.I and requires steel to produce.',
        --image='storage-2'
    },
    [2103] = {
        name='Planetary Logistics Station',
        type='LOGISTICS',
        grid_index=2210,
        stack_size=10,
        can_build=true,
        build_index=602,
        description='The hub of the planetary logistics system. Logistics drones will automatically transport cargo between stations when you set the corresponding items for supply and demand. <br>(Only enables delivery around its own planet.)',
        --image='logistic-station'
    },
    [2104] = {
        name='Interstellar Logistics Station',
        type='LOGISTICS',
        grid_index=2211,
        stack_size=10,
        can_build=true,
        build_index=603,
        description='The magnificent space elevator realizes more convenient transportation of materials between planets. It can connect factories on different planets to form a gigantic industrial empire.',
        --image='interstellar-logistic-station'
    },
    [2105] = {
        name='Orbital Collector',
        type='LOGISTICS',
        grid_index=2212,
        stack_size=10,
        can_build=true,
        build_index=604,
        description='Used to collect the resources of the gas giants, it needs to consume the collected fuel materials to maintain the energy required to work in orbit.',
        --image='orbital-collector'
    },
    [2106] = {
        name='Storage Tank',
        type='LOGISTICS',
        grid_index=2208,
        stack_size=50,
        can_build=true,
        build_index=403,
        description='The Storage Tank has a larger capacity than the Storage for storing fluid. When dismantling a non-empty Storage Tank any remaining fluid will be lost.',
        --image='storage-tank'
    },
    [2107] = {
        name='Logistics Distributor',
        type='LOGISTICS',
        grid_index=2209,
        stack_size=50,
        can_build=true,
        build_index=601,
        description="The Logistics Distributor can be built on top of the storage, and Logistics Bots will automatically transport the storage's contents to Icarus' Inventory or other Logistics Distributor based on demand. Being able to satisfy Icarus' needs for specific items and greatly increased efficiency in short range.",
        --image='delivery-machine'
    },
    [2201] = {
        name='Tesla Tower',
        type='LOGISTICS',
        grid_index=2101,
        stack_size=100,
        sub_id=1,
        can_build=true,
        build_index=101,
        description='The power transmission facility. Can extend the power supply range of the power grid with a certain connection length and supply area.',
        --image='tesla-coil'
    },
    [2202] = {
        name='Wireless Power Tower',
        type='LOGISTICS',
        grid_index=2102,
        stack_size=100,
        sub_id=2,
        can_build=true,
        build_index=102,
        description='Remote transmission facility. Can consume electricity from the power grid to charge the mecha.',
        --image='charging-pole'
    },
    [2203] = {
        name='Wind Turbine',
        type='PRODUCTION',
        grid_index=2104,
        stack_size=50,
        sub_id=4,
        can_build=true,
        build_index=104,
        description="The primary power facility. Can convert wind energy into electrical energy. The actual generation capacity is related to the planet's wind energy ratio.",
        --image='wind-turbine'
    },
    [2204] = {
        name='Thermal Power Plant',
        type='PRODUCTION',
        grid_index=2105,
        stack_size=50,
        sub_id=5,
        can_build=true,
        build_index=105,
        description='Facility that uses combustible materials (such as coal) as fuel to generate electrical energy. Energy loss between the energy value of the provided fuel and the produced electricity is expected.',
        --image='fuel-plant'
    },
    [2205] = {
        name='Solar Panel',
        type='PRODUCTION',
        grid_index=2106,
        stack_size=50,
        sub_id=7,
        can_build=true,
        build_index=106,
        description="Directly generate electricity using sunlight, and the actual generation capacity is related to the planet's solar energy ratio. Not working at night, use accumulators can store excess energy during the day.",
        --image='solar-panel'
    },
    [2206] = {
        name='Accumulator',
        type='LOGISTICS',
        grid_index=2411,
        stack_size=50,
        sub_id=8,
        can_build=true,
        build_index=109,
        description='Power storage facility. When the electricity of the power grid is surplus, it will automatically store the excess power. When the power supply is insufficient, it will automatically discharge to maintain the operation of the facilities.',
        --image='accumulator'
    },
    [2207] = {
        name='Accumulator (Full)',
        type='LOGISTICS',
        grid_index=2412,
        stack_size=50,
        sub_id=8,
        can_build=true,
        energy=270000000,
        fuel_chamber_boost=1.0,
        unlock_key=2206,
        explicit_tech_dep=1511,
        explicit_produce_from='Energy Exchanger',
        description='The accumulator in the fully charged state. When the power is insufficient, can be constructed as a facility to automatically discharge, or it can be placed in an energy exchanger to release electrical energy.',
        --image='accumulator-full'
    },
    [2208] = {
        name='Ray Receiver',
        type='PRODUCTION',
        grid_index=2110,
        stack_size=20,
        sub_id=9,
        can_build=true,
        build_index=802,
        description='Receives high-energy rays transmitted from the Dyson swarm or Dyson sphere. The received energy can be directly outputted to the power grid, or stored as photons in a critical state.',
        --image='ray-receiver'
    },
    [2209] = {
        name='Energy Exchanger',
        type='LOGISTICS',
        grid_index=2109,
        stack_size=20,
        sub_id=10,
        can_build=true,
        build_index=605,
        description='The power conversion facility. Can not only store the surplus electric energy in the power grid into an empty accumulator to make a full accumulator; it can also release the electric energy stored in the full accumulator.',
        --image='energy-exchanger'
    },
    [2210] = {
        name='Artificial Star',
        type='PRODUCTION',
        grid_index=2111,
        stack_size=20,
        sub_id=11,
        can_build=true,
        build_index=804,
        description='"All you have to do is let the positive and negative proton beams quietly cross the magnetic field from both ends into the constraint sphere, nice\'n easy!" This scaled-down version of the system is known as the Mini-sun.<br>',
        --image='fusion-reactor'
    },
    [2211] = {
        name='Mini Fusion Power Plant',
        type='PRODUCTION',
        grid_index=2108,
        stack_size=50,
        sub_id=6,
        can_build=true,
        build_index=108,
        description='Under the action of a high-strength, high-density magnetic field, this facility converts the huge energy released by the controlled fusion reaction of Deuteron fuel rods into electrical energy.',
        --image='fusion-power-station'
    },
    [2212] = {
        name='Satellite Substation',
        type='LOGISTICS',
        grid_index=2103,
        stack_size=30,
        sub_id=3,
        can_build=true,
        build_index=103,
        description='Wide-area power distribution facility. Provides longer range power transmission and a larger power supply area.',
        --image='orbital-substation'
    },
    [2213] = {
        name='Geothermal Power Station',
        type='PRODUCTION',
        grid_index=2107,
        stack_size=50,
        sub_id=12,
        can_build=true,
        build_index=107,
        description='A power generation facility using magma as an energy source. Combine multiple consecutive low-energy photons into one high-energy photon, and input energy to the grid stably. The power generation is directly related to the concentration of magma.',
        --image='geothermal-power-station'
    },
    [2301] = {
        name='Mining Machine',
        type='PRODUCTION',
        grid_index=2305,
        stack_size=50,
        sub_id=1,
        can_build=true,
        build_index=201,
        description='The more veins covered by the mining machine, the faster the mining speed, and the same vein can be covered by multiple mining rings, but the more mining rings covered, the faster the consumption.',
        --image='mining-drill'
    },
    [2302] = {
        name='Arc Smelter',
        type='PRODUCTION',
        grid_index=2404,
        stack_size=50,
        can_build=true,
        build_index=501,
        description='High temperature arc smelting can smelt ores and metals, and also be used for purification and crystal smelting.',
        --image='smelter'
    },
    [2303] = {
        name='Assembling Machine Mk.I',
        type='PRODUCTION',
        grid_index=2401,
        stack_size=50,
        can_build=true,
        build_index=503,
        description='The basic assembler. Can process iron and copper ingots into more advanced products.',
        --image='assembler-1'
    },
    [2304] = {
        name='Assembling Machine Mk.II',
        type='PRODUCTION',
        grid_index=2402,
        stack_size=50,
        can_build=true,
        build_index=504,
        description='The production speed has been greatly improved, and items can be processed more quickly.',
        --image='assembler-2'
    },
    [2305] = {
        name='Assembling Machine Mk.III',
        type='PRODUCTION',
        grid_index=2403,
        stack_size=50,
        can_build=true,
        build_index=505,
        description='The production speed is maximized, and a reasonable combination of conveyor belts and sorters of different speeds can effectively avoid the empty assembler or product blockage.',
        --image='assembler-3'
    },
    [2306] = {
        name='Water Pump',
        type='PRODUCTION',
        grid_index=2307,
        stack_size=30,
        can_build=true,
        build_index=203,
        description='Facility used to collect liquid resources from an ocean, including water and sulfuric acid.',
        --image='water-pump'
    },
    [2307] = {
        name='Oil Extractor',
        type='PRODUCTION',
        grid_index=2308,
        stack_size=20,
        can_build=true,
        build_index=204,
        description='When plasma is used to extract oil from the Crude oil seep, the extraction speed will be different for different Crude oil seep.',
        --image='oil-extractor'
    },
    [2308] = {
        name='Oil Refinery',
        type='PRODUCTION',
        grid_index=2309,
        stack_size=30,
        can_build=true,
        build_index=506,
        description='The extracted crude oil is further refined to obtain refined oil and hydrogen.',
        --image='oil-refinery'
    },
    [2309] = {
        name='Chemical Plant',
        type='PRODUCTION',
        grid_index=2409,
        stack_size=30,
        can_build=true,
        build_index=508,
        description='Chemical facility. Can process the primary products of Crude oil into more advanced chemical products.',
        --image='chemical-plant'
    },
    [2310] = {
        name='Miniature Particle Collider',
        type='PRODUCTION',
        grid_index=2310,
        stack_size=20,
        can_build=true,
        build_index=510,
        description='When the two beams of particles are continuously accelerated to a certain intensity and energy, they will collide, and new particles can be obtained. It is usually used to stably produce deuterium and antimatter, but will consume a lot of energy.',
        --image='hadron-collider'
    },
    [2311] = {
        name='EM-Rail Ejector',
        type='PRODUCTION',
        grid_index=2311,
        stack_size=30,
        can_build=true,
        build_index=801,
        description="Launch a large amount of solar sails into the orbit of the system's star to form a Dyson Swarm.",
        --image='em-rail-ejector'
    },
    [2312] = {
        name='Vertical Launching Silo',
        type='PRODUCTION',
        grid_index=2312,
        stack_size=10,
        can_build=true,
        build_index=803,
        description='Launch a small carrier rocket loaded with Dyson sphere components onto the Dyson sphere orbit to form nodes and frames.',
        --image='vertical-launching-silo'
    },
    [2313] = {
        name='Spray Coater',
        type='PRODUCTION',
        grid_index=2407,
        stack_size=50,
        can_build=true,
        build_index=310,
        description='After setting up the Spray Coater on the conveyor belt and inputting the Proliferator into the sprayer from the upper port, the cargos carried on the conveyor belt can be sprayed with the Proliferator. When the cargos are used as raw materials for the next level of production, it can obtain the effect of Extra Products or Production Speedup.',
        --image='spray-coater'
    },
    [2314] = {
        name='Fractionator',
        type='PRODUCTION',
        grid_index=2408,
        stack_size=30,
        can_build=true,
        build_index=507,
        description='Taking advantage of the high vapor pressure ratio of liquid hydrogen and liquid deuterium at a certain temperature, deuterium is fractionated from liquid hydrogen with a certain separation efficiency. Use a conveyor belt to introduce hydrogen from one side, after fractional distillation, export from the other side, and export the deuterium from the front port.',
        --image='fractionator'
    },
    [2315] = {
        name='Plane Smelter',
        type='PRODUCTION',
        grid_index=2405,
        stack_size=50,
        can_build=true,
        build_index=502,
        description='When monopoles pass through the Plane Filter, they produce a quantum effect of self-organizing and can generate a thermodynamic negative temperature flow. Using this technology, the process of ores smelting or purification can be greatly accelerated.',
        --image='smelter-2'
    },
    [2316] = {
        name='Advanced Mining Machine',
        type='PRODUCTION',
        grid_index=2306,
        stack_size=30,
        sub_id=2,
        can_build=true,
        build_index=202,
        description='Using the quantum chip to positively intervene the photon group generated by the exciter in the transition process, it can lead a obvious bunching effect of the laser beam. Under the action of the special gravitational field, the focused laser beam rapidly heats the ore veins along the predetermined path, transports in the form of particles and encapsulated into cargos. it can be built more convenient and have a higher gathering speed. The collected ores can be transported out by conveyor belts or logistics drones.',
        --image='mining-drill-mk2'
    },
    [2317] = {
        name='Quantum Chemical Plant',
        type='PRODUCTION',
        grid_index=2410,
        stack_size=30,
        can_build=true,
        build_index=509,
        description='By using quantum entanglement formed by strange matter at specific points, the most complex part of chaos phenomenon in chemical reactions could be decoupled to some extent. It could lead the reaction to proceed in a predetermined direction. If these magical points could be evolved, they could catalyze the corresponding chemical reaction.',
        --image='chemical-plant-2'
    },
    [2901] = {
        name='Matrix Lab',
        type='PRODUCTION',
        grid_index=2406,
        stack_size=50,
        can_build=true,
        build_index=701,
        description='Connector to the CenterBrain. Used to both produce matrices and research technologies. The more matrix labs, the faster production or research speed can progress.',
        --image='lab'
    },
    [3001] = {
        name='-',
        type='PRODUCTION',
        grid_index=0,
        stack_size=20,
        can_build=true,
        description='-',
        disabled=true,
        --image='turret-laser'
    },
    [3002] = {
        name='|',
        type='PRODUCTION',
        grid_index=0,
        stack_size=20,
        can_build=true,
        description='|',
        disabled=true,
        --image='turret-gauss'
    },
    [3003] = {
        name='--',
        type='PRODUCTION',
        grid_index=0,
        stack_size=20,
        can_build=true,
        description='--',
        disabled=true,
        --image='turret-cannon'
    },
    [3004] = {
        name='-|',
        type='PRODUCTION',
        grid_index=0,
        stack_size=20,
        can_build=true,
        description='-|',
        disabled=true,
        --image='turret-shield'
    },
    [3005] = {
        name='|-',
        type='PRODUCTION',
        grid_index=0,
        stack_size=20,
        can_build=true,
        description='|-',
        disabled=true,
        --image='turret-signal'
    },
    [3006] = {
        name='---',
        type='PRODUCTION',
        grid_index=0,
        stack_size=20,
        can_build=true,
        description='---',
        disabled=true,
        --image='turret-missile'
    },
    [3007] = {
        name='--|',
        type='PRODUCTION',
        grid_index=0,
        stack_size=20,
        can_build=true,
        description='--|',
        disabled=true,
        --image='turret-plasma'
    },
    [5001] = {
        name='Logistics Drone',
        type='LOGISTICS',
        grid_index=1510,
        stack_size=200,
        description='It can dynamically balance the supply and demand in the planetary logistics system, but it will only work for the logistics station it belongs to.',
        --image='logistic-drone'
    },
    [5002] = {
        name='Logistics Vessel',
        type='LOGISTICS',
        grid_index=1511,
        stack_size=50,
        description='It can dynamically balance the supply and demand of cargo between planets, and consumes space warper can activate warp.',
        --image='logistic-vessel'
    },
    [5003] = {
        name='Logistics Bot',
        type='LOGISTICS',
        grid_index=1509,
        stack_size=200,
        description='It can dynamically balance the supply and demand in the distribution logistics system, but it will not transport items to destinations outside of the distribution range.',
        --image='delivery-drone'
    },
    [6001] = {
        name='Electromagnetic Matrix',
        type='MATRIX',
        grid_index=1701,
        stack_size=200,
        description='One of the five basic source codes that keep the CentreBrain simulating, is the foundation of all scientific and technological research.',
        --image='t-matrix'
    },
    [6002] = {
        name='Energy Matrix',
        type='MATRIX',
        grid_index=1702,
        stack_size=200,
        description='One of the five basic source codes that keep the CentreBrain simulating, the emergence of the energy matrix has largely promoted the further development of technology.',
        --image='e-matrix'
    },
    [6003] = {
        name='Structure Matrix',
        type='MATRIX',
        grid_index=1703,
        stack_size=200,
        description='One of the five basic source codes that keep the CentreBrain simulating, can be used to unlock more advanced new structural materials.',
        --image='c-matrix'
    },
    [6004] = {
        name='Information Matrix',
        type='MATRIX',
        grid_index=1704,
        stack_size=200,
        description='One of the five basic source codes that keep the CentreBrain simulating, the level of informatization will largely affect the production efficiency of the base.',
        --image='i-matrix'
    },
    [6005] = {
        name='Gravity Matrix',
        type='MATRIX',
        grid_index=1705,
        stack_size=200,
        description='One of the five basic source codes that keep the CentreBrain simulating, to some extent, unifies quantum field theory and general relativity.',
        --image='g-matrix'
    },
    [6006] = {
        name='Universe Matrix',
        type='MATRIX',
        grid_index=1706,
        stack_size=200,
        description='Includes everything, the final answer to the theory of everything, solving the ultimate mystery of the universe!',
        --image='u-matrix'
    },
}