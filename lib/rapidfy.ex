defmodule Rapidfy do
  @moduledoc false

  def client_id, do: Application.get_env(:rapidfy, :client_id)
  def client_secret, do: Application.get_env(:rapidfy, :secret)
  def user_id, do: Application.get_env(:rapidfy, :user_id)

  def get_callback_url do
    Application.get_env(:rapidfy, :callback_url) |> URI.encode_www_form()
  end

  def creds do
    :base64.encode("#{client_id()}:#{client_secret()}")
  end
end
