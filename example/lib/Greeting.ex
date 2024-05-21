defmodule Greeting do
  @moduledoc """
  A module to interactively prompt for a user's name and age,
  validate the inputs, and print a greeting message.
  """

  @doc """
  Prompts the user with the given message and returns the trimmed input.

  ## Parameters
  - prompt: The message displayed to the user.

  ## Returns
  The trimmed string input from the user.
  """
  defp prompt_for_input(prompt) do
    IO.gets(prompt)
    |> String.trim()
  end

  @doc """
  Prompts the user to enter their name and ensures it is not empty.

  ## Returns
  The valid trimmed name entered by the user.
  """
  defp get_name() do
    name = prompt_for_input("Please enter your name: ")

    if String.length(name) > 0 do
      name
    else
      IO.puts("Invalid input: Please enter a valid name.")
      get_name()
    end
  end

  @doc """
  Prompts the user to enter their age, validates and parses it.
  Supports both integer and floating-point inputs, rounding floats to the nearest integer.

  ## Returns
  The valid integer age.
  """
  defp get_age() do
    input = prompt_for_input("Enter your age: ")

    case Integer.parse(input) do
      {age, ""} when age > 0 -> age

      _ ->
        case Float.parse(input) do
          {float_age, ""} when float_age > 0 ->
            float_age
            |> Float.round()
            |> trunc()

          _ ->
            IO.puts("Invalid input: Please enter a valid number for your age.")
            get_age()
        end
    end
  end

  @doc """
  Prints a greeting message with the user's name and age.

  ## Parameters
  - name: The name of the user.
  - age: The age of the user.
  """
  defp print_greeting(name, age) do
    IO.puts("Hello, my name is #{name} and I am #{age} years old.")
  end

  @doc """
  The main function that orchestrates the interaction with the user.
  It prompts for the user's name and age, then prints a greeting message.

  ## Returns
  :ok after the main process is completed.
  """
  def main do
    name = get_name()
    age = get_age()
    print_greeting(name, age)
    :ok
  end
end

# Run the main function to start the interaction
Greeting.main()
