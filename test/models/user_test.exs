defmodule Playerfinder.UserTest do
  use Playerfinder.ModelCase

  alias Playerfinder.User

  @valid_attrs %{country: "some content", email: "some content", password_digest: "some content", username: "some content", zip_code: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
