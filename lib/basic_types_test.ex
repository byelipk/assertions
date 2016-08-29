defmodule BasicTypesTest do
  use Assertions

  test "integer equals float when type checks are relaxed" do
    assert 1.0 == 1
  end

  test "integer does not equal float when type checks are enforced" do
    assert 1.0 !== 1
  end

end
