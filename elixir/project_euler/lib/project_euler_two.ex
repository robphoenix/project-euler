defmodule ProjectEuler.Two do

  @moduledoc """
  Solving problem #2 on
  [Project Euler](https://projecteuler.net/).
  """

  @doc """
  Problem 2: Even Fibonacci numbers

  Each new term in the Fibonacci sequence is generated by adding
  the previous two terms. By starting with 1 and 2, the first 10
  terms will be:

  1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

  By considering the terms in the Fibonacci sequence whose values
  do not exceed four million, find the sum of the even-valued terms.

  ## Examples

      iex> ProjectEuler.Two.sum_even_fib(100)
      44

      iex> ProjectEuler.Two.sum_even_fib(4000000)
      4613732

      iex> ProjectEuler.Two.sum_even_fib(-1)
      :error

  """
  @spec sum_even_fib(number()) :: number()
  def sum_even_fib(n) when n <= 0, do: :error
  def sum_even_fib(n) when n > 0 do
    Stream.unfold({0, 1}, fn {a, b} -> {a, {b, a + b}} end)
    |> Stream.filter(fn(x) -> rem(x, 2) == 0 end)
    |> Enum.take_while(fn(x) -> x < n end)
    |> Enum.sum
  end
end
