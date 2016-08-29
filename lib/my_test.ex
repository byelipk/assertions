defmodule MyTest do
  use Assertions   # invokes __using__ hook

  test "arithmetic addition works" do
    assert 5 + 1 == 6
  end

  test "arithmetic subtraction works" do
    assert 5 - 1 == 4
  end

  test "arithmetic multiplication works" do
    assert 5 * 2 == 10
  end

  test "arithmetic division works" do
    assert 10 / 2 == 5
  end

  test "integer division works" do
    assert div(10, 2) == 5
  end

  test "remainer division works" do
    assert rem(10, 3) == 1
  end

  test "logical greater than" do
    assert 1 > 0
  end

  test "logical less than" do
    assert 0 < 1
  end

  test "semantic equality" do
    assert 2.5 === 2.5
  end

  test "logical greater than or equal to" do
    assert 2.5 >= 2.5
    assert 2.5 >= 1
  end

  test "logical less than or equal to" do
    assert 2.5 <= 2.5
    assert 2.5 <= 5.8
  end
end
