import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect(){
        this.fetchData("processor")
    }

    processor(event){
        const select = event.target
        this.selectedProcessor = select.options[select.selectedIndex].text

        this.fetchData("motherboard", select.value)
        this.fetchDetails("processor", select.value, this.showProcessorDetails)
    }

    motherboard(event){
        const select = event.target
        this.selectedMotherboard = select.options[select.selectedIndex].text

        this.fetchData("ram", select.value)
        this.fetchDetails("motherboard", select.value, this.showMotherboardDetails)
    }

    ram(event){
        const select = event.target
        this.selectedRam = select.options[select.selectedIndex].text
        
        this.fetchData("graphics_card", select.value)
        this.fetchDetails("ram", select.value, this.showRamDetails)
    }

    graphics_card(event){
        const select = event.target
        this.selectedGraphicsCard = select.options[select.selectedIndex].text
        
        this.fetchData("psu", select.value)
        this.fetchDetails("graphics_card", select.value, this.showGraphicsCardDetails)
    }

    psu(event){
        const select = event.target
        this.selectedPowerSupply = select.options[select.selectedIndex].text
        this.fetchDetails("psu", select.value, this.showPowerSupplyDetails)

        const mmy = `${this.selectedProcessor} ${this.selectedMotherboard} ${this.selectedRam} ${this.selectedGraphicsCard} ${this.selectedPowerSupply}`
        document.getElementById("message-container").classList.remove("hidden")
        document.getElementById("message").innerHTML = mmy
    }

    fetchData(item, parent, name = "name") {
        const items = `find_${item}s`
        const path = [parent, items].join("/")
        fetch(path)
            .then(response => response.json())
            .then(data => { this.createOptionsFor(item, data, name)})
    }

    fetchDetails(item, parent, func) {
        const items = `${item}s_json`
        const path = [items, parent].join("/")
        fetch(path)
            .then(response => response.json())
            .then(data => { func(data)})
    }

    showProcessorDetails(data) {
        const title = `${data.brand} ${data.model}`
        const cores = `${data.cores} cores`
        const threads = `${data.threads} threads`
        const socketType = `Socket type: ${data.socket_type}`
        const baseSpeed = `Base speed: ${data.base_speed} GHz`
        const turboSpeed = `Turbo speed: ${data.turbo_speed} GHz`
        const architechture = `Architechture: ${data.architechture}`
        const coreFamily = `Core family: ${data.core_family}`
        const memoryType = `Memory type: ${data.memory_type}`
        const memoryFrequency = `Memory frequency: ${data.memory_frequency}`
        const series = `${data.series} series`
        const generation = `Generation ${data.generation}`
        document.getElementById("processor-container").classList.remove("hidden")
        document.getElementById("processor-title").innerHTML = title
        document.getElementById("processor-cores").innerHTML = cores
        document.getElementById("processor-threads").innerHTML = threads
        document.getElementById("processor-socket-type").innerHTML = socketType
        document.getElementById("processor-base-speed").innerHTML = baseSpeed
        document.getElementById("processor-turbo-speed").innerHTML = turboSpeed
        document.getElementById("processor-architechture").innerHTML = architechture
        document.getElementById("processor-core-family").innerHTML = coreFamily
        document.getElementById("processor-memory-type").innerHTML = memoryType
        document.getElementById("processor-memory-frequency").innerHTML = memoryFrequency
        document.getElementById("processor-series").innerHTML = series
        document.getElementById("processor-generation").innerHTML = generation
    }

    showMotherboardDetails(data) {
        const title = `${data.brand} ${data.model}`
        const chipset = `Chipset: ${data.chipset}`
        const formFactor = `Form factor: ${data.form_factor}`
        const socketType = `Socket type: ${data.socket_type}`
        const memorySlots = `${data.memory_slots} memory slots`
        const maxMemorySupport = `Max memory support: ${data.max_memory_support} GB`
        document.getElementById("motherboard-container").classList.remove("hidden")
        document.getElementById("motherboard-title").innerHTML = title
        document.getElementById("motherboard-chipset").innerHTML = chipset
        document.getElementById("motherboard-form-factor").innerHTML = formFactor
        document.getElementById("motherboard-socket-type").innerHTML = socketType
        document.getElementById("motherboard-memory-slots").innerHTML = memorySlots
        document.getElementById("motherboard-max-memory-support").innerHTML = maxMemorySupport
    }

    showRamDetails(data) {
        const title = `${data.brand} ${data.model}`
        const size = `${data.size} GB`
        const ramType = `RAM Type: ${data.ram_type}`
        const speed = `Speed: ${data.speed}`
        const dimmType = `DIMM Type: ${data.dimm_type}`
        const casLatency = `CAS latency: ${data.cas_latency} GB`
        document.getElementById("ram-container").classList.remove("hidden")
        document.getElementById("ram-title").innerHTML = title
        document.getElementById("ram-size").innerHTML = size
        document.getElementById("ram-type").innerHTML = ramType
        document.getElementById("ram-speed").innerHTML = speed
        document.getElementById("ram-dimm-type").innerHTML = dimmType
        document.getElementById("ram-cas-latency").innerHTML = casLatency
    }

    showGraphicsCardDetails(data) {
        const title = `${data.brand} ${data.model}`
        const memory = `${data.memory} GB`
        const memoryInterface = `Memory interface: ${data.memory_interface}`
        const length = `Length: ${data.length} mm`
        const gpuInterface = `Interface: ${data.interface}`
        const chipset = `Chipset: ${data.chipset}`
        const baseClock = `Base clock: ${data.base_clock} MHz`
        const clockSpeed = `Clock speed: ${data.clock_speed} MHz`
        document.getElementById("gpu-container").classList.remove("hidden")
        document.getElementById("gpu-title").innerHTML = title
        document.getElementById("gpu-memory").innerHTML = memory
        document.getElementById("gpu-memory-interface").innerHTML = memoryInterface
        document.getElementById("gpu-length").innerHTML = length
        document.getElementById("gpu-interface").innerHTML = gpuInterface
        document.getElementById("gpu-chipset").innerHTML = chipset
        document.getElementById("gpu-base-clock").innerHTML = baseClock
        document.getElementById("gpu-clock-speed").innerHTML = clockSpeed
    }

    showPowerSupplyDetails(data) {
        const title = `${data.brand} ${data.model}`
        const power = `${data.power} W`
        const efficiency = `Efficiency: ${data.efficiency}`
        const color = `Color: ${data.color}`
        document.getElementById("psu-container").classList.remove("hidden")
        document.getElementById("psu-title").innerHTML = title
        document.getElementById("psu-power").innerHTML = power
        document.getElementById("psu-efficiency").innerHTML = efficiency
        document.getElementById("psu-color").innerHTML = color
    }

    createOptionsFor(id, data, name = "name") {
        const dropDown = document.getElementById(id)
        dropDown.innerHTML = `<option>- Please select -</option>`
        data.forEach(item => {
            const opt = document.createElement("option")
            opt.value = item.id
            opt.innerHTML = `${item['brand']} ${item['model']}`
            dropDown.appendChild(opt)
        })
    }
}