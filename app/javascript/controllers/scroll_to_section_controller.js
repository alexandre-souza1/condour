import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll-to-section"
export default class extends Controller {

  scrollToSection(event) {
    const sectionId = event.target.hash.substring(1);
  }
}
