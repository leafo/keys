
config = require "lapis.config"

config {"development", "test"}, ->
  port 9898
  app_name "Selfwatch keys"
  postgres {
    database: "selfwatch_keys"
  }

config "test", ->
  postgres {
    database: "selfwatch_keys_test"
  }

