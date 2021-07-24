defmodule Rapidfy.Authentication do
  @moduledoc """
  Authenticates the Spotify user.

  After the application is authorized the request needs
  to be authenticated.
  """

  @url "https://accounts.spotify.com/api/token"

  alias HTTPoison.{
    Response,
    Error
  }

  @doc false
  def auth_post(params) do
    with {:ok, %Response{status_code: _status, body: data}} <- HTTPoison.post(@url, params, auth_headers()),
      {:ok, response} <- Poison.decode!(data) do
        case response do
          %{"error_description" => error} ->
            raise("#{error}")

          _success_response ->
            {:ok, nil}
        end
      else
        {:error, %Error{reason: r}} ->
          {:error, r}

        _ ->
          raise("Error parsing") # change to rapidfy error
      end
  end

  @doc false
  def auth_headers do
    [
      {"Authorization", "Basic #{Rapidfy.creds()}"},
      {"Content-Type", "application/x-www-form-urlencoded"}
    ]
  end

  @doc false
  def auth_type() do

  end

  @doc """
  Verifies or authenticates user on callback.

  ## Example: ##
      Rapidfy.verify(code)
      # {:ok, credentials}

  """
  def verify(code) do

  end

end
