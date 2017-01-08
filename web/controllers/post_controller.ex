defmodule Playerfinder.PostController do
  use Playerfinder.Web, :controller
  alias Playerfinder.Post

  def new(conn, _params) do
    changeset = Post.changeset(%Post{})

    conn
    |> assign(:changeset, changeset)
    |> render(:new)
  end

  def create(conn, %{"post" => params}) do
    changeset = Post.changeset(%Post{user_id: current_user(conn).id}, params)

    case Repo.insert(changeset) do
      { :ok, _post } ->
        redirect conn, to: dashboard_path(conn, :show)
      { :error, changeset } ->
        conn
        |> assign(:changeset, changeset)
        |> render(:new)
    end
  end
end
