import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["dateTime"]

  connect() {

  }

  resizeIframe(event) {
    let ifrm = event.target;
    let doc = ifrm.contentDocument ? ifrm.contentDocument : ifrm.contentWindow.document;
    ifrm.style.visibility = 'hidden';
    ifrm.style.height = "10px"; // reset to minimal height ...
    // IE opt. for bing/msn needs a bit added or scrollbar appears
    ifrm.style.height = this.getDocHeight(doc) + 4 + "px";
    ifrm.style.visibility = 'visible';
  }

  getDocHeight(doc) {
    doc = doc || document;
    // stackoverflow.com/questions/1145850/
    var body = doc.body, html = doc.documentElement;
    var height = Math.max(body.scrollHeight, body.offsetHeight,
      html.clientHeight, html.scrollHeight, html.offsetHeight);
    return height;
  }

  get dateTime() {
    return new Date(this.data.get('datetime'))
  }
}
