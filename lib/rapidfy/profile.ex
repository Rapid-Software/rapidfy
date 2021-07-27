defmodule Rapidfy.Profile do
  @moduledoc """
  Module for handling and recieving spotify profiles.

  Provides functions and structures for spotify profiles.
  """

  @url "https://api.spotify.com/v1/"

  alias Rapidfy.{
    Client,
    Profile
  }

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

  def get_profile(creds) do
    url = get_profile_url()
    Client.get(creds, url) |> Rapidfy.handle_response(%Profile{})
  end

  def get_profile(creds, id) do
    url = get_user_profile_url(id)
    Client.get(creds, url) |> Rapidfy.handle_response(%Profile{})
  end

  def get_profile_url() do
    "#{@url}/me"
  end

  def get_user_profile_url(id) do
    "#{@url}/users/#{id}"
  end
end
