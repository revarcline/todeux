defmodule Todeux.Repo.Migrations.CreateLists do
  use Ecto.Migration

  def change do
    create table(:lists) do
      add(:name, :string)
      add(:user_id, references(:users, on_delete: :delete_all, column: :id))

      timestamps()
    end

    create(index(:lists, [:user_id]))
  end
end
