defmodule CliToolsTest do
  use ExUnit.Case
  doctest CliTools

  test "greets the world" do
    assert CliTools.hello() == :world
  end
end
