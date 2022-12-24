import "../plugins/date.format"
export function timeAgoFromString(datetime, format = 'twitter') {
  datetime = new Date(datetime);
  let today = new Date();
  if (today.getFullYear() > datetime.getFullYear()) {
    return datetime.format('mm/dd/yy');
  } else {
    if (today.getDate() > datetime.getDate()) {
      return datetime.format('mmm dd');
    } else {
      return datetime.format('h:MM TT');
    }
  }
}
