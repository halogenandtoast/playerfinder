defmodule Playerfinder.Post do
  use Playerfinder.Web, :model

  schema "posts" do
    field :game, :string
    field :owns_game, :boolean
    belongs_to :user, Playerfinder.User

    timestamps()
  end

  def with_matches(post) do
    case Playerfinder.MatchFinder.find_matches(post) do
      [] -> { :unmatched, post }
      matches -> { :matched, post, matches }
    end
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
