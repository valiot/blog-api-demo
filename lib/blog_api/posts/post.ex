defmodule BlogApi.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field(:body, :string)
    field(:title, :string)
    belongs_to(:user, BlogApi.Accounts.User, foreign_key: :user_id)
    has_many(:comments, BlogApi.Posts.Comment)

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body, :user_id])
    |> validate_required([:title, :body, :user_id])
  end
end
