defmodule Todeux.TodoLists.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :done, :boolean, default: false
    field :name, :string
    belongs_to :list, Todeux.TodoLists.List
    belongs_to :user, Todeux.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:name, :done])
    |> validate_required([:name, :done])
  end
end
