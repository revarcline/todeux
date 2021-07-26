defmodule Todeux.Repo.Migrations.AddCreatedByToLists do
  use Ecto.Migration

  def change do
    alter table(:lists) do
      add(:created_by, references(:users, on_delete: :delete_all, column: :id))
    end

    create(index(:lists, [:created_by]))
  end
end
