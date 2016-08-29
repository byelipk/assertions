
defmodule Assertions do

  defmacro __using__(_opts) do
    quote do
      import unquote(__MODULE__)

      # See: http://elixir-lang.org/docs/stable/elixir/Module.html#register_attribute/3
      Module.register_attribute __MODULE__,
        :tests,
        accumulate: true,
        persist: false

      @before_compile unquote(__MODULE__)
    end
  end

  defmacro __before_compile__(_env) do
    quote do
      def run do
        @tests
          |> Enum.reverse
          |> Enum.each(fn({desc, test_case}) ->
              report(desc, apply(__MODULE__, test_case, [])) end)
      end
    end
  end

  defmacro test(desc, do: test_block) do
    func_name = desc
                  |> String.downcase
                  |> String.replace(~r/[^a-zA-Z0-9]/, "_")
                  |> String.to_atom

    quote do
      @tests { unquote(desc), unquote(func_name) }
      def unquote(func_name)(), do: unquote(test_block)
    end
  end

  defmacro assert({operator, _meta, [lhs, rhs]}) do
    quote do
      do_assert unquote(operator),
                unquote(lhs),
                unquote(rhs)
    end
  end

  def report(_desc, :ok), do: IO.write "."
  def report(desc, {:fail, message}) do
    IO.puts """

    FAIL: "#{desc}"
    #{message}
    """
  end


  # NOTE
  # Arithmetic Operators
  #
  # Addition          +        /2
  # Subtraction       -        /2
  # Multiplication    *        /2
  # Division          /        /2
  # Integer divison   div      /2
  # Remainder         rem      /2

  # NOTE
  # Data Structure Operators
  #
  # List concatination   ++/2
  # List subtraction     --/2
  # String concatination <>/2

  # NOTE
  # Boolean Operators
  #
  # Boolean OR           or         /2
  # Boolean AND          and        /2
  # Boolean NOT          not        /1
  # Short circuit OR     ||         /2
  # Short circuit AND    &&         /2
  # Short circuit NOT    !          /1

  # NOTE
  # Logical Operators
  #
  # Value equality               ==
  # Type and value equality      ===
  # Greater than                 >
  # Less than                    <
  # Greater than or equal to     >=
  # Less than or equal to        <=
  def do_assert(:==, lhs, rhs) when lhs == rhs do
    IO.write(".")
  end

  def do_assert(:==, lhs, rhs) do
    IO.puts """
    FAIL: Expected #{lhs} to equal #{rhs}
    """
  end

  def do_assert(:===, lhs, rhs) when lhs === rhs do
    IO.write(".")
  end

  def do_assert(:===, lhs, rhs) do
    IO.puts """
    FAIL: Expected #{lhs} to equal #{rhs}
    """
  end

  def do_assert(:>, lhs, rhs) when lhs > rhs do
    IO.write(".")
  end

  def do_assert(:>, lhs, rhs) do
    IO.puts """
    FAIL: Expected #{lhs} to be less than #{rhs}
    """
  end

  def do_assert(:<, lhs, rhs) when lhs < rhs do
    IO.write(".")
  end

  def do_assert(:<, lhs, rhs) do
    IO.puts """
    FAIL: Expected #{lhs} to be less than #{rhs}
    """
  end

  def do_assert(:>=, lhs, rhs) when lhs >= rhs do
    IO.write(".")
  end

  def do_assert(:>=, lhs, rhs) do
    IO.puts """
    FAIL: Expected #{lhs} to be greater than or equal to #{rhs}
    """
  end

  def do_assert(:<=, lhs, rhs) when lhs <= rhs do
    IO.write(".")
  end

  def do_assert(:<=, lhs, rhs) do
    IO.puts """
    FAIL: Expected #{lhs} to be less than or equal to #{rhs}
    """
  end
end
