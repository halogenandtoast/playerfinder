defmodule Playerfinder.SessionController do
  use Playerfinder.Web, :controller

  alias Playerfinder.Session

  def new(conn, _params) do
    render conn, :new
  end

  def create(conn, %{"session" => params}) do
    case Session.authenticate(params) do
      {:ok, user} ->
        conn
        |> put_session(:current_user_id, user.id)
        |> redirect(to: dashboard_path(conn, :show))
      :error ->
        conn
        |> put_flash(:error, "Invalid username or password")
        |> render(:new)
    end
  end

  def delete(conn, _params) do
    conn
    |> clear_session
    |> redirect(to: page_path(conn, :index))
  end
end
