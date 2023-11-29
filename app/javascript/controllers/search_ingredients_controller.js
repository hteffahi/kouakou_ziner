import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "input", "list"]

  connect() {
    console.log(this.formTarget)
    console.log(this.inputTarget)
    console.log(this.listTarget)
  }

  update(event) {
    let query = `?query=${this.inputTarget.value}`;
    const url = `${window.location.href}?query=${this.inputTarget.value}`;
    console.log(url);
    const params = new URLSearchParams(window.location.search);
    console.log(params);
    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data;
      })
  }
}
