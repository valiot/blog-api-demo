defmodule BlogApiWeb.Schema do
  use Absinthe.Schema
  import_types(BlogApiWeb.Schema.Types)
  import_types(Absinthe.Type.Custom)

  query do
    @desc "Get all users"
    field :users, list_of(:user) do
      resolve(&BlogApi.UserResolver.all/2)
    end

    @desc "Get info for user"
    field :user, type: :user do
      arg(:id, non_null(:id))
      resolve(&BlogApi.UserResolver.find/2)
    end

    @desc "Get all posts"
    field :posts, list_of(:post) do
      resolve(&BlogApi.PostResolver.all/2)
    end

    @desc "Get info for post"
    field :post, type: :post do
      arg(:id, non_null(:id))
      resolve(&BlogApi.PostResolver.find/2)
    end

    @desc "Get all comments"
    field :comments, list_of(:comment) do
      resolve(&BlogApi.CommentResolver.all/2)
    end

    @desc "Get info for comment"
    field :comment, type: :comment do
      arg(:id, non_null(:id))
      resolve(&BlogApi.CommentResolver.find/2)
    end
  end

  input_object :update_user_params do
    field(:name, :string)
    field(:last_name, :string)
    field(:username, :string)
    field(:password, :string)
  end

  input_object :update_post_params do
    field(:title, :string)
    field(:body, :string)
    field(:user_id, :integer)
  end

  input_object :update_comment_params do
    field(:body, :string)
    field(:user_id, :integer)
    field(:post_id, :integer)
  end

  mutation do
    @desc "Login"
    field :login, type: :session do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))

      resolve(&BlogApi.UserResolver.login/2)
    end

    @desc "Update user"
    field :update_user, type: :user do
      arg(:id, non_null(:integer))
      arg(:user, :update_user_params)

      resolve(&BlogApi.UserResolver.update/2)
    end

    @desc "Create user"
    field :create_user, type: :user do
      arg(:name, non_null(:string))
      arg(:last_name, non_null(:string))
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))

      resolve(&BlogApi.UserResolver.create/2)
    end

    @desc "Delete user"
    field :delete_user, type: :user do
      arg(:id, non_null(:id))

      resolve(&BlogApi.UserResolver.delete/2)
    end

    @desc "Update post"
    field :update_post, type: :post do
      arg(:id, non_null(:integer))
      arg(:post, :update_post_params)

      resolve(&BlogApi.PostResolver.update/2)
    end

    @desc "Create post"
    field :create_post, type: :post do
      arg(:title, non_null(:string))
      arg(:body, non_null(:string))
      arg(:user_id, non_null(:integer))

      resolve(&BlogApi.PostResolver.create/2)
    end

    @desc "Delete post"
    field :delete_post, type: :post do
      arg(:id, non_null(:id))

      resolve(&BlogApi.PostResolver.delete/2)
    end
  end
end
