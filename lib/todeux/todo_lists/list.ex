defmodule Todeux.TodoLists.List do
  use Ecto.Schema
  import Ecto.Changeset

  schema "lists" do
    field :name, :string
    has_many :todos, Todeux.TodoLists.Todo
    many_to_many(:users, Todeux.Accounts.User, join_through: Todeux.TodoLists.UserList)

    timestamps()
  end

  @doc false
  def changeset(list, attrs) do
    list
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
