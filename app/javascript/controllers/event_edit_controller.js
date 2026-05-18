import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "editButton"]

  show() {
    this.formTarget.classList.remove("hidden")
    this.editButtonTarget.classList.add("hidden")
  }

  hide() {
    this.formTarget.classList.add("hidden")
    this.editButtonTarget.classList.remove("hidden")
  }
}
