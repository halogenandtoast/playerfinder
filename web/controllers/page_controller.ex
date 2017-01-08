defmodule Playerfinder.PageController do
  use Playerfinder.Web, :controller
  alias Playerfinder.User

  def index(conn, _params) do
    changeset = User.changeset(%User{})

    conn
    |> assign(:changeset, changeset)
    |> render(:index)
  end
end
