defmodule Playerfinder.Registration do
  alias Playerfinder.Repo
  import Ecto.Changeset, only: [put_change: 3]

  def create(changeset) do
    changeset
    |> put_change(:password_digest, hashed_password(changeset.params["password"]))
    |> Repo.insert
  end

  defp hashed_password(password) do
    Comeonin.Bcrypt.hashpwsalt(password)
  end
end
