import { Controller } from "stimulus"
import tinymce from "tinymce"

export default class extends Controller {
  static targets = ["content"]

  connect() {
    debugger
    tinymce.init({
      selector: 'textarea'
    })
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
