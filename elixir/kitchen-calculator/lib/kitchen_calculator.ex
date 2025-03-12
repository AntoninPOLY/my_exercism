defmodule KitchenCalculator do
  def get_volume({ _, volume }) do
    volume
  end

  def to_milliliter({ unit, volume }) do
    case unit do
      :milliliter -> { :milliliter, volume }
      :cup -> { :milliliter, volume * 240 }
      :fluid_ounce -> { :milliliter, volume * 30 }
      :teaspoon -> { :milliliter, volume * 5 }
      :tablespoon -> { :milliliter, volume * 15 }
    end
  end

  def from_milliliter({ _, volume }, unit) do
    case unit do
      :milliliter -> { unit, volume }
      :cup -> { unit, volume * (1 / 240) }
      :fluid_ounce -> { unit, volume * (1 / 30) }
      :teaspoon -> { unit, volume * (1 / 5) }
      :tablespoon -> { unit, volume * (1 / 15) }
    end
  end

  def convert({ from, unit }, to) do
    { _, ml } = to_milliliter({ from, unit })
    from_milliliter({ :milliliter, ml}, to)
  end
end
