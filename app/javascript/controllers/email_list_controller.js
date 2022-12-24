import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // static targets = [ "output" ]

  connect() {
    // this.outputTarget.textContent = 'Hello, Stimulus!'
  }

  selectEmailItemController(selectedController) {
    this.emailItemControllers.forEach((controller) => {
      controller.active = controller === selectedController
    })
  }


  get emailItemControllers() {
    return this.application.controllers.filter((controller) => {
      return controller.identifier === 'email-item'
    })
  }
}
