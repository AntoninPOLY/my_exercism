defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    distance = sqrt(x * x + y * y)
    case distance do
      distance when distance <= 1 -> 10
      distance when distance <= 5 -> 5
      distance when distance <= 10 -> 1
      _ -> 0
    end
  end

  def sqrt(x), do: Float.pow(x * 1.0, 0.5)
end
