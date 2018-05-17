defmodule BlogApiWeb.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: BlogApi.Repo

  object :session do
    field(:token, :string)
  end

  object :post do
    field(:id, :id)
    field(:title, :string)
    field(:body, :string)
    field(:user, :user, resolve: assoc(:user))
    field(:comments, list_of(:comment), resolve: assoc(:comments))
  end

  object :user do
    field(:id, :id)
    field(:name, :string)
    field(:last_name, :string)
    field(:email, :string)
    field(:password, :string)
    field(:posts, list_of(:post), resolve: assoc(:posts))
    field(:comments, list_of(:comment), resolve: assoc(:comments))
  end

  object :comment do
    field(:id, :id)
    field(:body, :string)
    field(:user, :user, resolve: assoc(:user))
    field(:post, :post, resolve: assoc(:post))
  end
end
