import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="recipe"
export default class extends Controller {

  static targets = ['favoris']

  addToCookbook() {
    // Get the image element by ID
    const heartIcon = this.favorisTarget;
    console.log(heartIcon);
    // Remplacer la classe actuelle par la nouvelle classe
    heartIcon.classList.remove("fa-regular", "fa-heart");
    heartIcon.classList.add("fa-solid", "fa-heart");
  }
}
