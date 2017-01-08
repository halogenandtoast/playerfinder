defmodule Playerfinder.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :game, :string
      add :user_id, references(:users, on_delete: :nothing)
      add :owns_game, :boolean

      timestamps()
    end
    create index(:posts, [:user_id])

  end
end
