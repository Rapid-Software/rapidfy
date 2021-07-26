defmodule Rapidfy.Artist do
  @moduledoc """
  Module for handling and recieving spotify artists.

  Provides functions and structures for spotify artists.
  """

  defstruct ~w[
    external_urls
    followers
    genres
    href
    id
    images
    name
    popularity
    type
    uri
  ]a

end
