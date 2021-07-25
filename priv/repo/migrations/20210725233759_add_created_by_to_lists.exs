defmodule Todeux.Repo.Migrations.AddCreatedByToLists do
  use Ecto.Migration

  def change do
    alter table(:lists) do
      add(:created_by, references(:users, on_delete: :nothing))
    end

    create(index(:lists, [:created_by]))
  end
end
