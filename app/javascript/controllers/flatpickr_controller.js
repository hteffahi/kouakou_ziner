import { Controller } from "@hotwired/stimulus"
// import flatpickr from "stimulus-flatpickr";

export default class extends Controller {
  connect() {
    // this.config = {
    //   altInput: true,
    //   altFormat: "F j, Y",
    //   dateFormat: "Y-m-d",
    // };
    // super.connect();
    console.log('text'),
    flatpickr(this.element, {
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
    });
  }
}
