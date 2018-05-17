defmodule BlogApiWeb.Router do
  use BlogApiWeb, :router

  pipeline :graphql do
    plug(BlogApiWeb.Context)
  end

  scope "/api" do
    pipe_through(:graphql)
    resources("/comments", CommentController, except: [:new, :edit])
    resources("/posts", PostController, except: [:new, :edit])
    resources("/users", UserController, except: [:new, :edit])

    forward("/graphiql", Absinthe.Plug.GraphiQL, schema: BlogApiWeb.Schema)
    forward("/", Absinthe.Plug, schema: BlogApiWeb.Schema)
  end
end
