defmodule Rapidfy.Track do
  @moduledoc """
  Module for handling and recieving tracks.

  Provides functions and structures for spotify tracks.
  """

  defstruct ~w[
    album
    artists
    available_markets
    disc_number
    duration_ms
    explicit
    external_urls
    href
    id
    is_local
    is_playable
    linked_from
    name
    popularity
    preview_url
    restrictions
    track_number
    type
    uri
  ]a

end
