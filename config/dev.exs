use Mix.Config

config :music_db, MusicDB.Repo,
  database: "music_db_workshop_dev",
  username: "music_db_workshop",
  password: nil,
  hostname: "localhost"

