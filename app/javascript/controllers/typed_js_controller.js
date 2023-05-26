import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed-js"
export default class extends Controller {
  static targets = ['movie', 'text'];
  connect() {
    new Typed(this.textTarget, {
        strings: this.arrayTitle(this.movieTargets),
        typeSpeed: 50,
        loop: true
      })
  }

  arrayTitle(htmlArray) {
    let array = []
    htmlArray.forEach(element => {
      array.push(element.innerText)
    });
    return array
  };
}
