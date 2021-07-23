defmodule Todeux.TodoLists do
  @moduledoc """
  The TodoLists context.
  """

  import Ecto.Query, warn: false
  alias Todeux.Repo

  alias Todeux.TodoLists.List

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

      iex> create_list(%{field: value})
      {:ok, %List{}}

      iex> create_list(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_list(attrs \\ %{}) do
    %List{}
    |> List.changeset(attrs)
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
  def create_todo(attrs \\ %{}) do
    %Todo{}
    |> Todo.changeset(attrs)
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

  alias Todeux.TodoLists.UserList

  @doc """
  Returns the list of user_lists.

  ## Examples

      iex> list_user_lists()
      [%UserList{}, ...]

  """
  def list_user_lists do
    Repo.all(UserList)
  end

  @doc """
  Gets a single user_list.

  Raises `Ecto.NoResultsError` if the User list does not exist.

  ## Examples

      iex> get_user_list!(123)
      %UserList{}

      iex> get_user_list!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_list!(id), do: Repo.get!(UserList, id)

  @doc """
  Creates a user_list.

  ## Examples

      iex> create_user_list(%{field: value})
      {:ok, %UserList{}}

      iex> create_user_list(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_list(attrs \\ %{}) do
    %UserList{}
    |> UserList.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_list.

  ## Examples

      iex> update_user_list(user_list, %{field: new_value})
      {:ok, %UserList{}}

      iex> update_user_list(user_list, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_list(%UserList{} = user_list, attrs) do
    user_list
    |> UserList.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_list.

  ## Examples

      iex> delete_user_list(user_list)
      {:ok, %UserList{}}

      iex> delete_user_list(user_list)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_list(%UserList{} = user_list) do
    Repo.delete(user_list)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_list changes.

  ## Examples

      iex> change_user_list(user_list)
      %Ecto.Changeset{data: %UserList{}}

  """
  def change_user_list(%UserList{} = user_list, attrs \\ %{}) do
    UserList.changeset(user_list, attrs)
  end
end
