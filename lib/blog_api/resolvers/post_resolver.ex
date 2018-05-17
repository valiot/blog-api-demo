defmodule BlogApi.PostResolver do
  alias BlogApi.Posts

  def all(_args, %{context: %{current_user: _current_user}}) do
    {:ok, Posts.list_posts()}
  end

  def all(_args, _info) do
    {:error, "Not Authorized"}
  end

  def find(%{id: id}, %{context: %{current_user: _current_user}}) do
    case Posts.get_post(id) do
      nil -> {:error, "post id #{id} not found"}
      post -> {:ok, post}
    end
  end

  def find(_args, _info) do
    {:error, "Not Authorized"}
  end

  def create(args, %{context: %{current_user: _current_user}}) do
    Posts.create_post(args)
  end

  def create(_args, _info) do
    {:error, "Not Authorized"}
  end

  def update(%{id: id, post: post_params}, %{context: %{current_user: _current_user}}) do
    case Posts.get_post(id) do
      nil -> {:error, "post id #{id} not found"}
      post -> Posts.update_post(post, post_params)
    end
  end

  def update(_args, _info) do
    {:error, "Not Authorized"}
  end

  def delete(%{id: id}, %{context: %{current_user: _current_user}}) do
    case Posts.get_post(id) do
      nil -> {:error, "post id #{id} not found"}
      post -> Posts.delete_post(post)
    end
  end

  def delete(_args, _info) do
    {:error, "Not Authorized"}
  end
end
