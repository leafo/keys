lapis = require "lapis"

import respond_to, capture_errors_json, assert_error from require "lapis.application"
import assert_valid from require "lapis.validate"

class extends lapis.Application
  "/keys/put": capture_errors_json respond_to {
    before: =>
      assert_valid @params, {
        {"machine_id", is_integer: true}
        {"password", exists: true}
      }

      @machine_id = @params.machine_id

    GET: =>
      import Keys from require "models"
      res = Keys\select "
        where machine_id = ?
      ", @machine_id, fields: "max(id)"

      json: {
        max_id: res.max or -1
      }

    POST: =>
      import Keys from require "models"
      import from_json from require "lapis.util"

      content_type = assert_error @req.headers["content-type"], "missing content"
      assert_error content_type\lower!\match("application/json"), "expecting json body"
      ngx.req.read_body!
      data = from_json assert ngx.req.get_body_data!

      inserted = 0

      for {id, time, count} in *data
        Keys\create {
          :id, :time, :count
          machine_id: @machine_id
        }
        inserted += 1

      json: {
        success: true
        :inserted
      }
  }
