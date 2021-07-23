defmodule Todeux.TodoLists.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :done, :boolean, default: false
    field :name, :string
    field :list_id, :id
    field :created_by, :id

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:name, :done])
    |> validate_required([:name, :done])
  end
end
