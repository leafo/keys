

db = require "lapis.db"
schema = require "lapis.db.schema"

import add_column, create_index, drop_index, drop_column, create_table from schema

{
  :serial, :boolean, :varchar, :integer, :text, :foreign_key, :double, :time,
  :numeric, :enum
} = schema.types

package.preload.migrations =
  [1]: =>
    create_table "keys2", {
      {"id", integer}
      {"machine_id", foreign_key}
      {"time", time}
      {"count", integer}

      "PRIMARY KEY (machine_id, id)"
    }

    create_index "time"
