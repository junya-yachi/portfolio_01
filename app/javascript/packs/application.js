import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap';
import "../src/style.scss";

require('jquery');
require('bootstrap');
require('custom/header.js');
Rails.start()
Turbolinks.start()
ActiveStorage.start()
