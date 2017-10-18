lapis = require "lapis"

import respond_to, capture_errors_json from require "lapis.application"
import assert_valid from require "lapis.validate"


class extends lapis.Application
  "/keys/put": respond_to {
    before: =>
      assert_valid @params, {
        {"machine_id", is_integer: true}
        {"password", exists: true}
      }

    GET: =>
      import Keys from require "models"
      -- get max id
      json: {}

    POST: =>
      import Keys from require "models"
      -- write new keys
      json: {}
  }
