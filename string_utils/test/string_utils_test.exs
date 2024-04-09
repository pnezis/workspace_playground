defmodule StringUtilsTest do
  use ExUnit.Case
  doctest StringUtils

  test "greets the world" do
    assert StringUtils.hello() == :world
  end
end
