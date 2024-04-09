defmodule OrdersTest do
  use ExUnit.Case
  doctest Orders

  test "greets the world" do
    assert Orders.hello() == :world
  end
end
