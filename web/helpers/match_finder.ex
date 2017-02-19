defmodule Playerfinder.MatchFinder do
  import Ecto.Query

  alias Playerfinder.Post
  alias Playerfinder.Repo

  def find_matches(post) do
    post
    |> find_matches_query
    |> Repo.all
  end

  defp find_matches_query(%Post{game: game, user_id: user_id, owns_game: owns_game}) do
    from p in Post,
    where:
      p.game == ^game
        and p.user_id != ^user_id
        and (^owns_game or p.owns_game)
  end
end
