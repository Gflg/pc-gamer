# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'json'

gpus_file = File.read('db/data/graphics-cards.json')
gpus_data_hash = JSON.parse(gpus_file)

gpus_data_hash.each do |gpu_data|
    GraphicsCard.find_or_create_by(
        brand: gpu_data['brand'],
        model: gpu_data['model'],
        memory: gpu_data['memory'].split(" GB")[0],
        memory_interface: gpu_data['memory_interface'],
        length: gpu_data['length'].split(" mm")[0],
        interface: gpu_data['interface'],
        chipset: gpu_data['chipset'],
        base_clock: gpu_data['base_clock'].split(" MHz")[0],
        clock_speed: gpu_data['clock_speed'].split(" MHz")[0],
        frame_sync: gpu_data['frame_sync']
    )
end

motherboards_file = File.read('db/data/motherboards.json')
motherboards_data_hash = JSON.parse(motherboards_file)

motherboards_data_hash.each do |motherboard_data|
    Motherboard.find_or_create_by(
        brand: motherboard_data['brand'],
        model: motherboard_data['model'],
        chipset: motherboard_data['chipset'],
        form_factor: motherboard_data['form_factor'],
        socket_type: motherboard_data['socket_type'],
        memory_slots: motherboard_data['memory_slots'].split(" Slots")[0],
        max_memory_support: motherboard_data['max_memory_support'].split(" GB")[0]
    )
end

power_supplies_file = File.read('db/data/power-supplies.json')
power_supplies_data_hash = JSON.parse(power_supplies_file)

power_supplies_data_hash.each do |power_supply_data|
    PowerSupply.find_or_create_by(
        brand: power_supply_data['brand'],
        model: power_supply_data['model'],
        power: power_supply_data['power'].split(" W")[0],
        efficiency: power_supply_data['efficiency'],
        color: power_supply_data['color']
    )
end

processors_file = File.read('db/data/processors.json')
processors_data_hash = JSON.parse(processors_file)

processors_data_hash.each do |processor_data|
    memory_data = processor_data['memory_type']
    memory_type = memory_data.split(" - ")[0]
    memory_frequency = memory_data.split(" - ")[1].split(" MHz")[0]
    Processor.find_or_create_by(
        brand: processor_data['brand'],
        model: processor_data['model'],
        cores: processor_data['cores'],
        threads: processor_data['threads'],
        socket_type: processor_data['socket_type'],
        base_speed: processor_data['base_speed'].split(" GHz")[0],
        turbo_speed: processor_data['turbo_speed'].split(" GHz")[0],
        architechture: processor_data['architechture'],
        core_family: processor_data['core_family'],
        integrated_graphics: processor_data['integrated_graphics'],
        memory_type: memory_type,
        memory_frequency: memory_frequency,
        series: processor_data['series'],
        generation: processor_data['generation']
    )
end

rams_file = File.read('db/data/rams.json')
rams_data_hash = JSON.parse(rams_file)

rams_data_hash.each do |ram_data|
    Ram.find_or_create_by(
        brand: ram_data['brand'],
        model: ram_data['model'],
        size: ram_data['ram_size'].split(" GB")[0],
        ram_type: ram_data['ram_type'],
        speed: ram_data['ram_speed'].split(" MHz")[0],
        dimm_type: ram_data['dimm_type'],
        cas_latency: ram_data['cas_latency']
    )
end