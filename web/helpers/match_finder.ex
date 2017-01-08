defmodule Playerfinder.MatchFinder do
  import Ecto.Query

  alias Playerfinder.Post
  alias Playerfinder.Repo

  def find_matches(post) do
    find_matches_query(post)
    |> Repo.all
  end

  defp find_matches_query(%Post{game: game, user_id: user_id, owns_game: owns_game}) do
    query = from p in Post, where: p.game == ^game and p.user_id != ^user_id

    if owns_game do
      query
    else
      query |> where(owns_game: true)
    end
  end
end
