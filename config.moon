
config {"development", "test"}, ->
  app_name "Selfwatch keys"
  postgres {
    database: "selfwatch_keys"
  }

config "test", ->
  postgres {
    database: "selfwatch_keys_test"
  }

