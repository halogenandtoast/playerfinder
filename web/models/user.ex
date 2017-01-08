defmodule Playerfinder.User do
  use Playerfinder.Web, :model

  schema "users" do
    field :username, :string
    field :email, :string
    field :password_digest, :string
    field :password, :string, virtual: true
    field :country, :string
    field :zip_code, :string

    timestamps()

    has_many :posts, Playerfinder.Post
  end

  @required_fields [:username, :email, :password, :country, :zip_code]
  @permitted_fields @required_fields

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @permitted_fields)
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
    |> validate_required(@required_fields)
  end
end
