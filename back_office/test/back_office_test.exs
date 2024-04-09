defmodule BackOfficeTest do
  use ExUnit.Case
  doctest BackOffice

  test "greets the world" do
    assert BackOffice.hello() == :world
  end
end
