import TimeAgo from 'javascript-time-ago'
// Load locale-specific relative date/time formatting rules.
import en from 'javascript-time-ago/locale/en'

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "dateTime" ]
  timeAgo = new TimeAgo('en-US')

  connect() {
    TimeAgo.addLocale(en)

    this.dateTimeTarget.textContent = timeAgo.format(this.dateTime, 'twitter')
  }

  get dateTime() {
    return new Date(this.data.get('datetime'))
  }
}
