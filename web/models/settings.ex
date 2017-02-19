defmodule Playerfinder.Settings do
  import Ecto.Changeset

  alias Playerfinder.Repo

  @required_fields [:search_radius]
  @permitted_fields @required_fields

  def update(user, params) do
    user
    |> changeset(params)
    |> Repo.update
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @permitted_fields)
    |> validate_number(:search_radius, greater_than: 0)
    |> validate_required(@required_fields)
  end
end
