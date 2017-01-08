defmodule Playerfinder.UserController do
  use Playerfinder.Web, :controller

  alias Playerfinder.User
  alias Playerfinder.Registration

  def new(conn, _params) do
    changeset = User.changeset(%User{})

    conn
    |> assign(:changeset, changeset)
    |> render(:new)
  end

  def create(conn, %{"user" => params}) do
    changeset = User.changeset(%User{}, params)

    case Registration.create(changeset) do
      {:ok, user} ->
        conn
        |> put_session(:current_user_id, user.id)
        |> redirect(to: dashboard_path(conn, :show))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Failed to create user")
        |> assign(:changeset, changeset)
        |> render(:new)
    end
  end
end
