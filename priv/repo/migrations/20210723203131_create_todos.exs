defmodule Todeux.Repo.Migrations.CreateTodos do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add(:name, :string)
      add(:done, :boolean, default: false, null: false)
      add(:list_id, references(:lists, on_delete: :delete_all, column: :id))
      add(:created_by, references(:users, on_delete: :delete_all, column: :id))

      timestamps()
    end

    create(index(:todos, [:list_id]))
    create(index(:todos, [:created_by]))
  end
end
