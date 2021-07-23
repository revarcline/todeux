defmodule Todeux.TodoLists.UserList do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_lists" do
    field :list_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(user_list, attrs) do
    user_list
    |> cast(attrs, [])
    |> validate_required([])
  end
end
