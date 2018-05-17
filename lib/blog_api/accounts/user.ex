defmodule BlogApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:email, :string)
    field(:last_name, :string)
    field(:name, :string)
    field(:password_hash, :string)
    field(:password, :string, virtual: true)
    field(:token, :string)
    has_many(:comments, BlogApi.Posts.Comment)
    has_many(:posts, BlogApi.Posts.Post)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :last_name, :email, :password_hash])
    |> validate_required([:name, :last_name, :email])
  end

  def update_changeset(user, params \\ %{}) do
    user
    |> cast(params, [:name, :last_name, :email], [:password])
    |> validate_required([:name, :last_name, :email])
    |> put_pass_hash
  end

  def registration_changeset(user, params \\ %{}) do
    user
    |> cast(params, [:name, :last_name, :email, :password])
    |> validate_required([:name, :last_name, :email, :password])
    |> put_pass_hash
  end

  def store_token_changeset(user, params \\ %{}) do
    user
    |> cast(params, [:token])
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(password))

      _ ->
        changeset
    end
  end
end
