import { Controller } from "@hotwired/stimulus"
import { timeAgoFromString } from "../helpers"

export default class extends Controller {
  static targets = ["dateTime"]

  connect() {
    this.dateTime = timeAgoFromString(this.dateTime)
  }

  fetchEmail() {
    fetch(this.url)
      .then(function (response) {
        return response.text()
      })
      .then(function (text) {
        document.getElementById('emailContainer').innerHTML = text
      });
  }

  get dateTime() {
    return new Date(this.data.get('datetime'))
  }

  get url() {
    return this.data.get('url')
  }

  set dateTime(text) {
    this.dateTimeTarget.textContent = text
  }
}
