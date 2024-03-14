import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hide-cpf"
export default class extends Controller {
  static targets = ["cpf"]
  connect() {
    console.log(this.cpfTarget);
  }

  hide() {
    if (this.cpfTarget.type == "password") {
      this.cpfTarget.type = "text";
      this.element.querySelector('i').classList.remove('fa-eye');
      this.element.querySelector('i').classList.add('fa-eye-slash');
    } else {
      this.cpfTarget.type = "password";
      this.element.querySelector('i').classList.remove('fa-eye-slash');
      this.element.querySelector('i').classList.add('fa-eye');
    }
  }
}
