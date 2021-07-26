defmodule Rapidfy.Client do
  @moduledoc """
  Provides API Methods to the library.
  """

  alias Rapidfy.Credentials

  def get(creds, url) do
    HTTPoison.get(url, get_h(creds))
  end

  def put(creds, url, body \\ "") do
    HTTPoison.put(url, body, content_h(creds))
  end

  def post(creds, url, body \\ "") do
    HTTPoison.post(url, body, content_h(creds))
  end

  def delete(creds, url) do
    HTTPoison.get(url, get_h(creds))
  end

  @doc false
  def get_h(%Credentials{access_token: token}) do
    [
      {"Authorization", "Bearer #{token}"}
    ]
  end

  @doc false
  def content_h(%Credentials{access_token: token}) do
    [
      {"Authorization", "Bearer #{token}"},
      {"Content-Type", "application/json"}
    ]
  end

end
