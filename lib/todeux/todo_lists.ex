defmodule Todeux.TodoLists do
  @moduledoc """
  The TodoLists context.
  """

  import Ecto.Query, warn: false
  alias Ecto.Changeset
  alias Todeux.Repo

  alias Todeux.TodoLists.List
  alias Todeux.TodoLists.Todo
  alias Todeux.Accounts.User

  @doc """
  Returns the list of lists.

  ## Examples

      iex> list_lists()
      [%List{}, ...]

  """
  def list_lists do
    Repo.all(List)
  end

  @doc """
  Returns the list of all lists for a given user.

  ## Examples

  iex> list_user_lists(%User{})
      [%List{}, ...]

  """

  def list_user_lists(%User{} = user) do
    List
    |> user_todolist_query(user)
    |> Repo.all()
  end

  @doc """
  Gets a single list.

  Raises `Ecto.NoResultsError` if the List does not exist.

  ## Examples

      iex> get_list!(123)
      %List{}

      iex> get_list!(456)
      ** (Ecto.NoResultsError)

  """
  def get_list!(id), do: Repo.get!(List, id)

  @doc """
  Creates a list.
  ## Examples

      iex> create_list(%User{}, %{field: value})
      {:ok, %List{}}

      iex> create_list(%User{}, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_list(%User{} = user, attrs \\ %{}) do
    %List{}
    |> List.changeset(attrs)
    |> Changeset.put_assoc(:user, user)
    |> Repo.insert()
  end

  @doc """
  Updates a list.

  ## Examples

      iex> update_list(list, %{field: new_value})
      {:ok, %List{}}

      iex> update_list(list, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_list(%List{} = list, attrs) do
    list
    |> List.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a list.

  ## Examples

      iex> delete_list(list)
      {:ok, %List{}}

      iex> delete_list(list)
      {:error, %Ecto.Changeset{}}

  """
  def delete_list(%List{} = list) do
    Repo.delete(list)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking list changes.

  ## Examples

      iex> change_list(list)
      %Ecto.Changeset{data: %List{}}

  """
  def change_list(%List{} = list, attrs \\ %{}) do
    List.changeset(list, attrs)
  end

  alias Todeux.TodoLists.Todo

  @doc """
  Returns the list of todos.

  ## Examples

      iex> list_todos()
      [%Todo{}, ...]

  """
  def list_todos do
    Repo.all(Todo)
  end

  @doc """
  Returns the list of a user's todos.

  ## Examples

      iex> list_todos(%User{})
      [%Todo{}, ...]

  """

  def list_user_todos(%User{} = user) do
    Todo
    |> user_todolist_query(user)
    |> Repo.all()
  end

  @doc """
  Gets a single todo.

  Raises `Ecto.NoResultsError` if the Todo does not exist.

  ## Examples

      iex> get_todo!(123)
      %Todo{}

      iex> get_todo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_todo!(id), do: Repo.get!(Todo, id)

  @doc """
  Creates a todo.

  ## Examples

      iex> create_todo(%{field: value})
      {:ok, %Todo{}}

      iex> create_todo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_todo(%User{} = user, %List{} = list, attrs \\ %{}) do
    %Todo{}
    |> Todo.changeset(attrs)
    |> Changeset.put_assoc(:user, user)
    |> Changeset.put_assoc(:list, list)
    |> Repo.insert()
  end

  @doc """
  Updates a todo.

  ## Examples

      iex> update_todo(todo, %{field: new_value})
      {:ok, %Todo{}}

      iex> update_todo(todo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_todo(%Todo{} = todo, attrs) do
    todo
    |> Todo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a todo.

  ## Examples

      iex> delete_todo(todo)
      {:ok, %Todo{}}

      iex> delete_todo(todo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_todo(%Todo{} = todo) do
    Repo.delete(todo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking todo changes.

  ## Examples

      iex> change_todo(todo)
      %Ecto.Changeset{data: %Todo{}}

  """
  def change_todo(%Todo{} = todo, attrs \\ %{}) do
    Todo.changeset(todo, attrs)
  end

  defp user_todolist_query(query, %User{id: user_id}) do
    from(t in query,
      where: t.user_id == ^user_id,
      preload: [:user]
    )
  end
end
