defmodule Rapidfy.Playlist do
  @moduledoc """
  Module for handling and recieving spotify playlists.

  Provides functions and structures for spotify playlists.
  """

  defstruct ~w[
    collaborative
    description
    external_urls
    followers
    href
    id
    images
    name
    owner
    public
    snapshot_id
    tracks
    type
    uri
  ]a
end
