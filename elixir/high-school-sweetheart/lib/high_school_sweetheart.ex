defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name
    |> String.trim
    |> String.first
  end

  def initial(name) do
    name
    |> first_letter
    |> String.upcase
    |> add_dot
  end
  def add_dot(str), do: str <> "."

  def initials(full_name) do
    [first, last] = String.split(full_name)
    "#{initial(first)} #{initial(last)}"
  end

  def pair(full_name1, full_name2) do
    in1 = initials(full_name1)
    in2 = initials(full_name2)
      """
      ******       ******
    **      **   **      **
  **         ** **         **
 **            *            **
 **                         **
 **     #{in1}  +  #{in2}     **
  **                       **
    **                   **
      **               **
        **           **
          **       **
            **   **
              ***
               *
 """
  end
end
