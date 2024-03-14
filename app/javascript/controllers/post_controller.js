import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="post"
export default class extends Controller {
  static targets = [ "list" ]

  createPost(event) {
    event.preventDefault();

    fetch(event.currentTarget.action, {
      method: "POST",
      headers: { "Accept": "text/plain" },
      body: new FormData(event.currentTarget)
    })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.insertAdjacentHTML("afterbegin", data);
      })
  }
}
