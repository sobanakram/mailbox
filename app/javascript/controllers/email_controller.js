import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "dateTime" ]

  connect() {

  }

  get dateTime() {
    return new Date(this.data.get('datetime'))
  }
}
