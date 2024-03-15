import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comment"
export default class extends Controller {
  connect() {
    console.log("Hello from comment_controller.js")
  }
}
