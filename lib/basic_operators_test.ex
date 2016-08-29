defmodule BasicOperatorsTest do
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

  test "list concatination works" do
    assert [1,2] ++ [3,4] == [1,2,3,4]
  end

  test "list subtraction works" do
    assert [1,2] -- [2] == [1]
  end

  test "string concatination works" do
    assert "Hello" <> " world!" == "Hello world!"
  end

  test "boolean OR works" do
    assert (true or false) == true
  end

  test "boolean || works" do
    assert (false || true)  == true
  end

  test "boolean AND works" do
    assert (false and true)  == false
  end

  test "boolean && works" do
    assert (true && false)  == false
  end

  test "boolean NOT works" do
    assert (not true) == false
  end

  test "boolean ! works" do
    assert (!true) == false
  end

end
