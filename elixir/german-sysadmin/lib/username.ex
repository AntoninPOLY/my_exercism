defmodule Username do
  def sanitize(username, aggr \\ ~c"")
  def sanitize([], aggr), do: aggr
  def sanitize([head | rest], aggr) do
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

    sanitize(rest, aggr ++ head)
  end
end
