// stimulus_controllers/personality_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  // static targets = ["selectedOption"];
  // answers = [];

  connect() {
    this.element.querySelectorAll(".option").forEach((label) => {
      label.addEventListener("click", this.handleLabelClick.bind(this));
    });
  }

  handleLabelClick(event) {
    const label = event.currentTarget;
    console.log("label", label);
    const dataIndex = label.dataset.index;
    const dataOption = label.dataset.option;

    this.element.querySelectorAll(".option").forEach((label) => {
      label.classList.remove("selected");
    });

    const badge = document.getElementById("badge");
    if (dataIndex === "1" || dataIndex === "2") {
      badge.classList.add("hidden");
    }
    label.classList.add("selected");
  }
}
