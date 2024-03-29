import { Controller } from "@hotwired/stimulus"
import { timeAgoFromString } from "../helpers"

export default class extends Controller {
  static targets = ["dateTime"]

  connect() {
    this.updateDateTime()
  }

  updateDateTime() {
    this.dateTimeTarget.textContent = timeAgoFromString(this.dateTime)
    this.dateTimeTarget.title = new Date(this.dateTime).format("h:MM TT  dddd, mmmm dS, yyyy")
  }

  fetchEmail() {
    if (!this.isActive) {
      fetch(this.url)
        .then((response) => {
          return response.text()
        })
        .then((text) => {
          document.getElementById('emailContainer').innerHTML = text
        });
    }
    this.emailListController.selectEmailItemController(this)
    this.element.classList.remove('unread')
  }

  get emailListController() {
    return this.application.controllers.find((controller) => {
      return controller.identifier === 'email-list'
    })
  }

  get dateTime() {
    return new Date(this.data.get('datetime'))
  }

  get url() {
    return this.data.get('url')
  }

  get isActive() {
    return this.element.classList.contains('active')
  }

  set active(active) {
    if (active) {
      this.element.classList.add('active')
    } else {
      this.element.classList.remove('active')
    }
  }
}
