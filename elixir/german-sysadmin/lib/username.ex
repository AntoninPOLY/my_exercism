defmodule Username do
  def sanitize([]), do: []
  def sanitize([head | rest]) do
    head =
      case head do
        ?\s -> ~c""
        ?\t -> ~c""
        ?ä -> ~c"ae"
        ?ö -> ~c"oe"
        ?ü -> ~c"ue"
        ?ß -> ~c"ss"
        ?_ -> ~c"_"
        head when head in ?a..?z -> [head]
        _ -> []
      end

      head ++ sanitize(rest)
  end
end
