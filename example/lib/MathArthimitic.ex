defmodule MathArthimitic do
  @moduledoc """
  A module for performing basic arithmetic operations.
  This module includes functions for addition, subtraction, multiplication,
  division, and exponentiation. Some functions return closures to support
  partial application.
  """

  @doc """
  Returns a closure that adds `a` to its argument `b`.

  ## Examples

      iex> add_five = MathArthimitic.add(5)
      iex> add_five.(3)
      8

  """
  def add(a) do
    fn b ->
      result = a + b
      print(:add, a, b, result)
      result
    end
  end

  @doc """
  Returns a closure that subtracts its argument `b` from `a`.

  ## Examples

      iex> subtract_five = MathArthimitic.subtract(5)
      iex> subtract_five.(3)
      2

  """
  def subtract(a) do
    fn b ->
      result = a - b
      print(:subtract, a, b, result)
      result
    end
  end

  @doc """
  Returns a closure that divides `a` by its argument `b`.
  Returns an error tuple if `b` is zero.

  ## Examples

      iex> divide_ten = MathArthimitic.divide(10)
      iex> divide_ten.(2)
      5.0

      iex> divide_ten.(0)
      {:error, :division_by_zero}

  """
  def divide(a) do
    fn b ->
      case b do
        0 ->
          {:error, :division_by_zero} # Handle division by zero
        _ ->
          result = a / b
          print(:divide, a, b, result)
          result
      end
    end
  end

  @doc """
  Returns the square of `a`.

  ## Examples

      iex> MathArthimitic.power(4)
      16

  """
  def power(a) do
    result = a * a
    print(:power, a, a, result)
    result
  end

  @doc """
  Returns a closure that multiplies `a` by its argument `b`.

  ## Examples

      iex> multiply_by_three = MathArthimitic.multiply(3)
      iex> multiply_by_three.(4)
      12

  """
  def multiply(a) do
    fn b ->
      result = a * b
      print(:multiply, a, b, result)
      result
    end
  end

  @doc false
  # Makes `print` function private. This function logs the operation details.
  defp print(operation, a, b, result) do
    IO.puts("#{operation} : #{a}, #{b} = #{result}")
  end
end
