import TimeAgo from 'javascript-time-ago'
// Load locale-specific relative date/time formatting rules.
import en from 'javascript-time-ago/locale/en'

TimeAgo.addLocale(en)

export function timeAgoFromString(timeStr, format = 'twitter') {
  let timeAgo = new TimeAgo('en-US')
  return timeAgo.format(timeStr, format)
}