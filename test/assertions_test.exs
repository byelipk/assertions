defmodule AssertionsTest do
  use ExUnit.Case
  doctest Assertions

  test "the truth" do
    assert 1 + 1 == 2
  end
end
