defmodule AccountsTest do
  use ExUnit.Case
  doctest Accounts

  test "greets the world" do
    assert Accounts.hello() == :world
  end
end
