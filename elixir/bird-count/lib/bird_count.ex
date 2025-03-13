defmodule BirdCount do
  def today([]), do: nil
  def today([ head | tail ]) do
    head
  end

  def increment_day_count([]), do: [1]
  def increment_day_count([ head | tail ]) do
    [ head + 1 | tail ]
  end

  def has_day_without_birds?(list) do
    Enum.any?(list, fn i -> if i == 0, do: true, else: false end)
  end

  def total(list) do
    Enum.sum list
  end

  def busy_days(list) do
    Enum.filter(list, fn i -> if i >= 5, do: true, else: false end)
    |> length
  end
end
