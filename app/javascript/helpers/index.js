import "../plugins/date.format"

export function timeAgoFromString(datetime) {
  datetime = new Date(datetime)
  let today = new Date()
  if (today.getFullYear() > datetime.getFullYear()) {
    return datetime.format('mm/dd/yy')
  } else {
    if (today.toDateString() === datetime.toDateString()) {
      return datetime.format('h:MM TT')
    } else {
      return datetime.format('mmm dd')
    }
  }
}
