lapis = require "lapis"

import respond_to, capture_errors_json from require "lapis.application"
import assert_valid from require "lapis.validate"


class extends lapis.Application
  "/keys/put": capture_errors_json respond_to {
    before: =>
      assert_valid @params, {
        {"machine_id", is_integer: true}
        {"password", exists: true}
      }

    GET: =>
      import Keys from require "models"
      res = Keys\select "
        where machine_id = ?
      ", @params.machine_id, fields: "max(id)"

      json: {
        max_id: res.max or -1
      }

    POST: =>
      import Keys from require "models"
      -- write new keys
      json: {}
  }
