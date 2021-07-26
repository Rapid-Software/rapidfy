defmodule Rapidfy.Profile do
  @moduledoc """
  Module for handling and recieving spotify profiles.

  Provides functions and structures for spotify profiles.
  """

  defstruct ~w[
    country
    display_name
    email
    explicit_content
    external_urls
    followers
    href
    id
    images
    product
    type
    uri
  ]a
end
