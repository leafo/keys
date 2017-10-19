import use_test_server from require "lapis.spec"
import request from require "lapis.spec.server"
import truncate_tables from require "lapis.spec.db"

describe "app", ->
  use_test_server!

  it "requests /keys/put with missing params", ->
    status, res = request "/keys/put", expect: "json"
    assert.same {
      errors: {
        "machine_id must be an integer",
        "password must be provided"
      }
    }, res


