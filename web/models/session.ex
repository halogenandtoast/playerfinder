defmodule Playerfinder.Session do
  alias Playerfinder.Repo
  alias Playerfinder.User

  def current_user(conn) do
    id = Plug.Conn.get_session(conn, :current_user_id)

    if id do
      Repo.get(User, id)
    end
  end

  def signed_in?(conn) do
    !!current_user(conn)
  end

  def authenticate(%{"email" => email, "password" => password}) do
    case Repo.get_by(User, email: email) do
      nil -> :error
      user -> authenticate(password, user)
    end
  end

  defp authenticate(password, user=%{password_digest: password_digest}) do
    if Comeonin.Bcrypt.checkpw(password, password_digest) do
      {:ok, user}
    else
      :error
    end
  end
end
