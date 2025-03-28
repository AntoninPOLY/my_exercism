defmodule BirdCount do
  def today([]), do: nil
  def today([ head | _ ]) do
    head
  end

  def increment_day_count([]), do: [1]
  def increment_day_count([ head | tail ]) do
    [ head + 1 | tail ]
  end

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([ head | tail ]) do
    case head do
      0 -> true
      _ -> has_day_without_birds?(tail)
    end
  end

  def total([]), do: 0
  def total([ head | tail ]) do
    head + total(tail)
  end

  def busy_days([]), do: 0
  def busy_days([ head | tail ]) do
    cond do
      head >= 5 -> 1 + busy_days(tail)
      head < 5  -> 0 + busy_days(tail)
    end
  end
end
