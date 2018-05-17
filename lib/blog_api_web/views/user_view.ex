defmodule BlogApiWeb.UserView do
  use BlogApiWeb, :view
  alias BlogApiWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      last_name: user.last_name,
      email: user.email,
      password_hash: user.password_hash,
      token: user.token}
  end
end
