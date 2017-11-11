import use_test_server from require "lapis.spec"
import request from require "lapis.spec.server"
import truncate_tables from require "lapis.spec.db"

import Keys from require "models"


import types from require "tableshape"

describe "app", ->
  use_test_server!

  before_each ->
    truncate_tables Keys

  it "requests /keys/put with missing params", ->
    status, res = request "/keys/put", expect: "json"
    assert.same {
      errors: {
        "machine_id must be an integer",
        "password must be provided"
      }
    }, res


  it "gets max id when there are no keys", ->
    status, res = request "/keys/put", {
      expect: "json"
      get: {
        machine_id: 1
        password: "test"
      }
    }

    assert.same {
      max_id: -1
    }, res

  it "puts keys", ->
    status, res = request "/keys/put", {
      expect: "json"
      get: {
        machine_id: 1
        password: "test"
      }
      headers: {
        "Content-type": "application/json"
      }
      post: '[[1,"2017-12-1 00:00:00",1],[2,"2017-12-2 00:00:00",2]]'
    }

    assert.same {
      success: true
      inserted: 2
    }, res


    inserted = Keys\select "order by id asc"
    assert (types.shape {
      types.shape {
        id: 1
        machine_id: 1
        count: 1
        time: "2017-12-01 00:00:00"
      }

      types.shape {
        id: 2
        machine_id: 1
        count: 2
        time: "2017-12-02 00:00:00"
      }

    }) inserted

