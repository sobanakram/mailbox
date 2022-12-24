import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["card", "cardBody", "emailInput", "subjectInput", "bodyInput"]
  static  values = {}

  connect() {
  }

  toggle() {
    this.cardBodyTarget.classList.toggle('d-none')
  }

  close() {
    this.cardTarget.classList.add('d-none')
    this.reset()
  }

  open() {
    this.cardTarget.classList.remove('d-none')
    this.cardBodyTarget.classList.remove('d-none')
  }

  reset() {
    this.emailInputTarget.value = ""
    this.subjectInputTarget.value = ""
    this.bodyInputTarget.value = ""
  }
}
