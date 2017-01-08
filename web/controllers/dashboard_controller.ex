defmodule Playerfinder.DashboardController do
  use Playerfinder.Web, :controller
  alias Playerfinder.MatchFinder

  def show(conn, _params) do
    posts = get_matched_posts(conn) |> Enum.group_by(&(elem &1, 0))

    conn
    |> assign(:posts, posts)
    |> render(:show)
  end

  defp get_posts(conn) do
    conn
    |> current_user
    |> assoc(:posts)
    |> Repo.all
  end

  # { :matched | :unmatched, post, matches }
  defp get_matched_posts(conn) do
    posts = get_posts(conn)
    Enum.map posts, fn post ->
      case MatchFinder.find_matches(post) do
        [] -> { :unmatched, post }
        matches -> { :matched, post, matches }
      end
    end
  end
end
