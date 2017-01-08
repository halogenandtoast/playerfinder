defmodule Playerfinder.DashboardController do
  use Playerfinder.Web, :controller
  alias Playerfinder.Post

  def show(conn, _params) do
    posts = get_matched_posts(conn)

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

  defp get_matched_posts(conn) do
    get_posts(conn)
    |> Enum.map(&Post.with_matches/1)
    |> Enum.group_by(&(elem &1, 0))
  end
end
