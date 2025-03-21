defmodule SpaceAge do
  @seconds_in_a_year 31_557_600
  @conversion_table %{
    mercury: 0.2408467,
    venus: 0.61519726,
    earth: 1.0,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.7913
  }
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(planet, seconds) do
    conversion_rate = Map.get(@conversion_table, planet)
    age = seconds_to_years(seconds)

    case conversion_rate do
      nil -> {:error, "not a planet"}
      c -> {:ok, Float.round(age / c, 2)}
    end
  end

  defp seconds_to_years(seconds), do: seconds / @seconds_in_a_year
end
