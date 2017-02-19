defmodule Playerfinder.SettingsController do
  use Playerfinder.Web, :controller

  alias Playerfinder.Settings

  def edit(conn, _params) do
    conn
    |> assign(:search_radius, current_user(conn).search_radius)
    |> render :edit
  end

  def update(conn, %{ "settings" => params }) do
    case Settings.update(current_user(conn), params) do
      { :ok, user } ->
        conn
        |> put_flash(:info, "Updated settings")
        |> redirect(to: dashboard_path(conn, :show))
      { :error, changeset } ->
        conn
        |> put_flash(:error, "Failed to update settings")
        |> render(:edit)
    end
  end
end
