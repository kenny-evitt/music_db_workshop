defmodule MusicDB.Exercises.SchemaExercises do
  import Ecto.Query

  alias MusicDB.{
    Artist,
    Repo,
    Track
  }

  def convert_schema_less_query do
    # Convert the query below to use the Artist schema.
    query =
      from(a in "artists",
        where: a.birth_date >= ^~D[1990-11-15],
        select: [a.name]
      )

    query = from a in Artist, where: a.birth_date >= ^~D[1990-11-15]

    Repo.all(query)
  end

  def insert_a_track! do
    # Use Repo.insert! to insert a %Track{} with whatever title and index you like.
    Repo.insert!(%Track{index: 13, title: "OMG"})
  end

  def delete_an_album!(album) do
    # Use Repo.delete to delete the album
    Repo.delete(album)
  end
end
