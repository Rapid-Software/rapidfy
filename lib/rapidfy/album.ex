defmodule Rapidfy.Album do
  @moduledoc """
  Module for handling and recieving spotify albums.

  Provides functions and structures for spotify albums.
  """

  defstruct ~w[
    album_type
    artists
    external_ids
    external_urls
    genres
    href
    id
    images
    label
    name
    popularity
    release_date
    release_date_precision
    restrictions
    total_tracks
    tracks
    type
    uri
  ]a


end
