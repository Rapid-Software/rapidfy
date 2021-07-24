defmodule Rapidfy.Credentials do
  @moduledoc """
  Provides functions and structures for spotify tokens.
  """

  alias Rapidfy.Credentials

  @doc """
    Credential struct.
  """
  defstruct [:access_token, :refresh_token]

  @doc """
    Create a Credential struct from provided tokens.
  """
  def create_creds(a, r) do
    %Credentials{access_token: a, refresh_token: r}
  end

  @doc """
    Create a Credential struct from spotify auth response.
  """
  def res_to_creds(res) do
    Credentials.create_creds(res["access_token"], res["refresh_token"])
  end

end
