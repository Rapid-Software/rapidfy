defmodule RapidfyTest do
  use ExUnit.Case
  doctest Rapidfy

  test "greets the world" do
    assert Rapidfy.hello() == :world
  end
end
