defmodule HighScore do
  @default_score 0

  def new() do
    %{}
  end

  def add_player(scores, name, score \\ 0) do
    Map.put(scores, name, score)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    Map.put(scores, name, @default_score)
  end

  def update_score(scores, name, score) do
    old_score = Map.get(scores, name, 0)
    Map.put(scores, name, old_score + score)
  end

  def get_players(scores) do
    Map.to_list(scores)
    |> Enum.map(fn {name, _} -> name end)
    |> Enum.sort
  end
end
