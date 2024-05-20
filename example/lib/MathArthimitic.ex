defmodule MathArthimitic do
  # Add function with closure in it
  def add(a) do
    # clsoure
    fn b ->
      result = a + b
      print(:add, a, b, result)
      result
    end
  end

  def subtract(a) do
    # closure
    fn b ->
      result = a - b
      print(:subtract, a, b, result)
      result
    end
  end

  def divide(a) do
    fn b ->
      # i want 0 divsion to throw an error
      case b do
        # throw an error here
        0 ->
          {:error, :division_by_zero} # note this is not the best way to do this should use try and catch but for our purposes it is okay
          IO.puts(:error)
        _ ->
          result = a / b
          print(:multiply, a, b, result)
          result
      end
    end
  end

  def power(a) do
    result = a * a
    print(:power, a, a, result)
    result
  end

  def multiply(a) do
    fn b ->
      result = a * b
      print(:multiply, a, b, result)
      result
    end
  end

  # Make `print` function private
  defp print(operation, a, b, result) do
    IO.puts("#{operation} : #{a} * #{b} = #{result}")
  end
end
