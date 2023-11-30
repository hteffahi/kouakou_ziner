import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-ingredient"
export default class extends Controller {
  connect() {
    console.log("connecter")
    this.beforeBuild = []
  }
  append(event){
    console.log(event);
    const isContain = event.target.parentElement.classList.value.includes("my-card")
    if (!isContain) {
      event.target.classList.toggle("green")
    } else {
      event.target.parentElement.classList.toggle("green")
    }
    let ingredient = event.target.parentElement.querySelector(".card-title").innerText
    this.buildQuery(ingredient)
  }

  buildQuery(ingredient){
    if (this.beforeBuild.includes(ingredient)) {
      const index = this.beforeBuild.indexOf(ingredient)
      this.beforeBuild.splice(index, 1)
    } else {
      this.beforeBuild.push(ingredient)
    }
    console.log("test", this.beforeBuild)
  }
  submit(){
    const built = this.beforeBuild.length ? this.beforeBuild.join(",") : this.beforeBuild.join()
    if (this.beforeBuild.length) {
      const baseUrl = `${window.location.origin}/recipes/fetch?query=${built}`
      window.location.replace(baseUrl)
    } else {
      alert("No product chosen")
    }
  }
}
