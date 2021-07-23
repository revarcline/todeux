defmodule Todeux.Repo.Migrations.CreateUserLists do
  use Ecto.Migration

  def change do
    create table(:user_lists) do
      add :list_id, references(:lists, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:user_lists, [:list_id])
    create index(:user_lists, [:user_id])
  end
end
