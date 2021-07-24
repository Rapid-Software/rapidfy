defmodule Rapidfy.Authorization do
  @moduledoc """
  Authorizes the Spotify application.

  Provides developer provided info to build and deliver
  auth url and callback url.
  """

  def get_url() do
    scopes = get_scopes()

    if scopes != "" do
      "https://accounts.spotify.com/authorize?client_id=#{Rapidfy.client_id()}&response_type=code&redirect_uri=#{
        Rapidfy.get_callback_url()
      }&scope=#{scopes}"
    else
      "https://accounts.spotify.com/authorize?client_id=#{Rapidfy.client_id()}&response_type=code&redirect_uri=#{
        Rapidfy.get_callback_url()
      }"
    end
  end

  def get_scopes() do
    Application.get_env(:rapidfy, :scopes)
    |> Enum.join(" ")
    |> URI.encode()
  end

end
