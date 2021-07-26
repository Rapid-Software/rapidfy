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

  alias Rapidfy.Credentials

  @doc false
  def auth_post(params) do
    with {:ok, %Response{status_code: _status, body: data}} <- HTTPoison.post(@url, params, auth_headers()),
      {:ok, response} <- Poison.decode!(data) do
        case response do
          %{"error_description" => error} ->
            raise("#{error}")

          success_response ->
            {:ok, Credentials.res_to_creds(success_response)}
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
  def auth_type(%Credentials{refresh_token: r}) do
    "grant_type=refresh_token&refresh_token=#{r}"
  end

  @doc false
  def auth_type(%Credentials{refresh_token: nil}, code) do
    "grant_type=authorization_code&code=#{code}&redirect_uri=#{Rapidfy.get_callback_url()}"
  end

  @doc """
  Verifies or authenticates user on callback.

  ## Example: ##
      Rapidfy.verify(code)
      # {:ok, credentials}

  """
  def verify(%{"code" => code}) do
    auth_type(%Credentials{}, code) |> auth_post()
  end

  @doc false
  def verify(_) do
    raise("Error no code") # change to rapidfy error
  end

end
