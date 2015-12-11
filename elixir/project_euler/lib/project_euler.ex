defmodule ProjectEuler do

  @moduledoc """
  Solving the problems on
  [Project Euler](https://projecteuler.net/).
  """

  @doc """
  Multiples of 3 and 5
  Problem 1
  If we list all the natural numbers below 10 that are multiples
  of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

  Find the sum of all the multiples of 3 or 5 below 1000.

    iex(2)> ProjectEuler.problem_one(10)
    23

  """
  @spec problem_one(integer()) :: integer()
  def problem_one(n) do
    (for i <- 1..n-1, rem(i, 3) == 0 or rem(i, 5) == 0, do: i)
    |> Enum.sum
  end

  @doc """
  Even Fibonacci numbers
  Problem 2
  Each new term in the Fibonacci sequence is generated by adding
  the previous two terms. By starting with 1 and 2, the first 10
  terms will be:

  1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

  By considering the terms in the Fibonacci sequence whose values
  do not exceed four million, find the sum of the even-valued terms.

    iex(2)> ProjectEuler.problem_two(100)
    44

  """
  @spec problem_two(number()) :: number()
  def problem_two(n) do
    Stream.unfold({0, 1}, fn {a, b} -> {a, {b, a + b}} end)
    |> Stream.filter(fn(x) -> rem(x, 2) == 0 end)
    |> Enum.take_while(fn(x) -> x < n end)
    |> Enum.sum
  end
end
