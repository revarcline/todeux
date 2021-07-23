defmodule Todeux.TodoLists.UserList do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_lists" do
    belongs_to :user, Todeux.Accounts.User
    belongs_to :list, Todeux.TodoLists.List

    timestamps()
  end

  @doc false
  def changeset(user_list, attrs) do
    user_list
    |> cast(attrs, [])
    |> validate_required([])
  end
end
