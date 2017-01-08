defmodule Playerfinder.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :email, :string
      add :password_digest, :string
      add :country, :string
      add :zip_code, :string

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
