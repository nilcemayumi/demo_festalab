import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["queryString"]
  connect() {
    console.log("cjkdashfkljaskl")
    console.log(this.queryStringTarget.value)
  }

}
