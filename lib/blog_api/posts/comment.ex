defmodule BlogApi.Posts.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field(:body, :string)

    belongs_to(:user, BlogApi.Accounts.User, foreign_key: :user_id)
    belongs_to(:post, BlogApi.Posts.Post, foreign_key: :post_id)

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:body, :user_id, :post_id])
    |> validate_required([:body, :user_id, :post_id])
  end
end
