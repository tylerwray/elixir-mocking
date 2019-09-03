defmodule BoredomTest do
  use ExUnit.Case
  doctest Boredom

  test "greets the world" do
    assert Boredom.hello() == :world
  end
end
