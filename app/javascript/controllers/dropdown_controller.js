import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect(){
        this.fetchData("processor")
    }

    processor(event){
        const select = event.target
        this.selectedProcessor = select.options[select.selectedIndex].text

        this.fetchData("motherboard", select.value)
    }

    motherboard(event){
        const select = event.target
        this.selectedMotherboard = select.options[select.selectedIndex].text

        this.fetchData("ram", select.value)
    }

    ram(event){
        const select = event.target
        this.selectedRam = select.options[select.selectedIndex].text
        
        this.fetchData("graphics_card", select.value)
    }

    graphics_card(event){
        const select = event.target
        this.selectedGraphicsCard = select.options[select.selectedIndex].text
        
        this.fetchData("psu", select.value)
    }

    psu(event){
        const select = event.target
        this.selectedPowerSupply = select.options[select.selectedIndex].text
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