// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

import jQuery from "jquery"
window.jQuery = jQuery // <- "select2" will check this
window.$ = jQuery
