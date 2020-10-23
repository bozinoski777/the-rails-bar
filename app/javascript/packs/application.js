

// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import { Application } from 'stimulus'
import { autoload } from 'stimulus/webpack-helpers'

const application = Application.start()
const controllers = require.context("../controllers", true, /\.js$/)

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
// require("local-time").start()

window.Rails = Rails

import 'bootstrap';
import 'data-confirm-modal';

$(document).on("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})

import "controllers"
