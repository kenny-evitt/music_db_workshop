defmodule MusicDB.Exercises.ChangesetExercises do
  import Ecto.Changeset
  alias MusicDB.{Repo, Artist, Album}

  def create_changeset_for_artist(artist) do
    # create a changeset for the given Artist struct - your changeset should set
    # the name to "Sarah Vaughan"
    change(artist, name: "Sarah Vaughan")
  end

  def create_changeset_from_map(params) do
    # create a changeset for an Artist struct using the given params, but ONLY allow
    # the name, and birth_date values
    cast(%Artist{}, params, [:name, :birth_date])
  end

  def changeset_for_track(track, params) do
    # create a changeset using the given %Track{} struct and params. Your changeset should
    # use cast() and do the following:
    #   - allow only the title and duration values
    #   - require title and duration values
    #   - require that the duration value be greater than 0
    cast(track, params, [:title, :duration])
    |> validate_required([:title, :duration])
    |> validate_number(:duration, greater_than: 0)
  end

  def create_album_for_artist(artist, album_title) do
    # use Ecto.build_assoc to create an %Album{} struct with the given title, whose
    # parent record is the given artist
    Ecto.build_assoc(artist, :albums, %Album{title: album_title})
  end

  def create_child_records_with_put_assoc(artist, albums) do
    # Create a changeset for the given artist that uses put_assoc to set the given albums
    # as the child album records for the artist.
    #
    # Note that you will need to preload the album records for the artist struct before
    # attempting to call put_assoc
    artist = Repo.preload(artist, :albums)

    change(artist)
    |> put_assoc(:albums, artist.albums ++ albums)

    # The `++` in the code above is unnecessary for this test because there are no existing albums:
    change(artist)
    |> put_assoc(:albums, albums)
  end

  def create_child_records_with_cast_assoc(artist, albums) do
    # Create a changeset for the given artist that uses cast_assoc to set the given albums
    # as the child album records for the artist.
    #
    # Note that you will need to preload the album records for the artist struct before
    # attempting to call cast_assoc
    artist = Repo.preload(artist, :albums)

    cast(artist, %{albums: albums}, [])
    |> cast_assoc(:albums, artist.albums ++ albums)

    # The `++` in the code above is unnecessary for this test because there are no existing albums:
    cast(artist, %{albums: albums}, [])
    |> cast_assoc(:albums, albums)
  end

  # I added this test myself:
  def add_child_records_with_cast_assoc(artist, albums) do
    # Create a changeset for the given artist that uses cast_assoc to set the given albums
    # as the child album records for the artist.
    #
    # Note that you will need to preload the album records for the artist struct before
    # attempting to call cast_assoc
    artist = Repo.preload(artist, :albums)

    IO.inspect (artist.albums ++ albums) # TODO: Remove

    # TODO: The first `albums` should include the existing albums, but they need to be converted to regular maps first. The Ecto Query API includes a `map` function/operator that can be used in `select` clauses.
    cast(artist, %{albums: albums}, [])
    |> cast_assoc(:albums, artist.albums ++ albums)
  end

end
