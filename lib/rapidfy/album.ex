defmodule Rapidfy.Album do
  @moduledoc """
  Module for handling and recieving spotify albums.

  Provides functions and structures for spotify albums.
  """

  @url "https://api.spotify.com/v1/albums"

  alias Rapidfy.{
    Album,
    Client
  }

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

  def get_album(id, creds) do
    url = id |> get_album_url()
    Client.get(creds, url) |> Rapidfy.handle_response(%Album{})
  end

  def get_album_url(id) do
    "#{@url}/#{id}"
  end

  def get_albums(ids, creds) do # untested
    url = ids |> get_albums_url()
    Client.get(creds, url) |> Rapidfy.handle_response(%{"albums" => [%Album{}]})
  end

  def get_albums_url(ids) do
    "#{@url}/#{ids}"
  end

end
