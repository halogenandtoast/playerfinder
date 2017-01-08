defmodule Playerfinder.Post do
  use Playerfinder.Web, :model

  schema "posts" do
    field :game, :string
    field :owns_game, :boolean
    belongs_to :user, Playerfinder.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:game, :owns_game])
    |> validate_required([:game, :owns_game])
  end
end
