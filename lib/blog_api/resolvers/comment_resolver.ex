defmodule BlogApi.CommentResolver do
  alias BlogApi.Posts

  def all(_args, %{context: %{current_user: _current_user}}) do
    {:ok, Posts.list_comments()}
  end

  def all(_args, _info) do
    {:error, "Not Authorized"}
  end

  def find(%{id: id}, %{context: %{current_user: _current_user}}) do
    case Posts.get_comment(id) do
      nil -> {:error, "comment id #{id} not found"}
      comment -> {:ok, comment}
    end
  end

  def find(_args, _info) do
    {:error, "Not Authorized"}
  end

  def create(args, %{context: %{current_user: _current_user}}) do
    Posts.create_comment(args)
  end

  def create(_args, _info) do
    {:error, "Not Authorized"}
  end

  def update(%{id: id, comment: comment_params}, %{context: %{current_user: _current_user}}) do
    case Posts.get_comment(id) do
      nil -> {:error, "comment id #{id} not found"}
      comment -> Posts.update_comment(comment, comment_params)
    end
  end

  def update(_args, _info) do
    {:error, "Not Authorized"}
  end

  def delete(%{id: id}, %{context: %{current_user: _current_user}}) do
    case Posts.get_comment(id) do
      nil -> {:error, "comment id #{id} not found"}
      comment -> Posts.delete_comment(comment)
    end
  end

  def delete(_args, _info) do
    {:error, "Not Authorized"}
  end
end
