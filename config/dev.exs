use Mix.Config

config :music_db, MusicDB.Repo,
  hostname: "localhost",
  port: 5433,
  database: "music_db_workshop_dev",
  username: "music_db_workshop",
  password: nil
