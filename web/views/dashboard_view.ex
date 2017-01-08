defmodule Playerfinder.DashboardView do
  use Playerfinder.Web, :view

  def render_post(post=%Playerfinder.Post{}) do
    Playerfinder.PostView.render("post.html", post: post)
  end

  def render_matched_posts(posts) do
    for {_, post, _matches} <- Map.get(posts, :matched, []) do
      render_post(post)
    end
  end

  def render_unmatched_posts(posts) do
    for {_, post} <- Map.get(posts, :unmatched, []) do
      render_post(post)
    end
  end
end
