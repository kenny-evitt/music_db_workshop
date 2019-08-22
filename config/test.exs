use Mix.Config

config :music_db, MusicDB.Repo,
  hostname: "localhost",
  port: 5433,
  database: "music_db_workshop_test",
  username: "music_db_workshop",
  password: nil,
  pool: Ecto.Adapters.SQL.Sandbox,
  ownership_timeout: 60_000
