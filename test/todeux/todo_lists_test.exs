defmodule Todeux.TodoListsTest do
  use Todeux.DataCase

  alias Todeux.TodoLists

  describe "lists" do
    alias Todeux.TodoLists.List

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def list_fixture(attrs \\ %{}) do
      {:ok, list} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TodoLists.create_list()

      list
    end

    test "list_lists/0 returns all lists" do
      list = list_fixture()
      assert TodoLists.list_lists() == [list]
    end

    test "get_list!/1 returns the list with given id" do
      list = list_fixture()
      assert TodoLists.get_list!(list.id) == list
    end

    test "create_list/1 with valid data creates a list" do
      assert {:ok, %List{} = list} = TodoLists.create_list(@valid_attrs)
      assert list.name == "some name"
    end

    test "create_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TodoLists.create_list(@invalid_attrs)
    end

    test "update_list/2 with valid data updates the list" do
      list = list_fixture()
      assert {:ok, %List{} = list} = TodoLists.update_list(list, @update_attrs)
      assert list.name == "some updated name"
    end

    test "update_list/2 with invalid data returns error changeset" do
      list = list_fixture()
      assert {:error, %Ecto.Changeset{}} = TodoLists.update_list(list, @invalid_attrs)
      assert list == TodoLists.get_list!(list.id)
    end

    test "delete_list/1 deletes the list" do
      list = list_fixture()
      assert {:ok, %List{}} = TodoLists.delete_list(list)
      assert_raise Ecto.NoResultsError, fn -> TodoLists.get_list!(list.id) end
    end

    test "change_list/1 returns a list changeset" do
      list = list_fixture()
      assert %Ecto.Changeset{} = TodoLists.change_list(list)
    end
  end

  describe "todos" do
    alias Todeux.TodoLists.Todo

    @valid_attrs %{done: true, name: "some name"}
    @update_attrs %{done: false, name: "some updated name"}
    @invalid_attrs %{done: nil, name: nil}

    def todo_fixture(attrs \\ %{}) do
      {:ok, todo} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TodoLists.create_todo()

      todo
    end

    test "list_todos/0 returns all todos" do
      todo = todo_fixture()
      assert TodoLists.list_todos() == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert TodoLists.get_todo!(todo.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      assert {:ok, %Todo{} = todo} = TodoLists.create_todo(@valid_attrs)
      assert todo.done == true
      assert todo.name == "some name"
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TodoLists.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{} = todo} = TodoLists.update_todo(todo, @update_attrs)
      assert todo.done == false
      assert todo.name == "some updated name"
    end

    test "update_todo/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = TodoLists.update_todo(todo, @invalid_attrs)
      assert todo == TodoLists.get_todo!(todo.id)
    end

    test "delete_todo/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{}} = TodoLists.delete_todo(todo)
      assert_raise Ecto.NoResultsError, fn -> TodoLists.get_todo!(todo.id) end
    end

    test "change_todo/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = TodoLists.change_todo(todo)
    end
  end
end
