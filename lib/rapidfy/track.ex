defmodule Rapidfy.Track do
  @moduledoc """
  Module for handling and recieving tracks.

  Provides functions and structures for spotify tracks.
  """

  @url "https://api.spotify.com/v1/tracks"

  alias Rapidfy.{
    Track,
    Client
  }

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

  def get_track(creds, id) do
    url = get_track_url(id)
    Client.get(creds, url) |> Rapidfy.handle_response(%Track{})
  end

  def get_tracks(creds, id) do
    url = get_track_url(id)
    Client.get(creds, url) |> Rapidfy.handle_response(%{"tracks" => [%Track{}]})
  end

  def get_track_url(id) do
    "#{@url}/#{id}"
  end

end
