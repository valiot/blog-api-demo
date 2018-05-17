defmodule BlogApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :last_name, :string
      add :email, :string
      add :password_hash, :string
      add :token, :text

      timestamps()
    end

  end
end
