import { Controller } from "@hotwired/stimulus"
import 'select2';
import "jquery";

// Connects to data-controller="select"
export default class extends Controller {
  static targets = ["select2"]

  connect() {
    $('.select2').select2();
  }
}
