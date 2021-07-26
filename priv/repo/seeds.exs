# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Todeux.Repo.insert!(%Todeux.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Todeux.Accounts.User
alias Todeux.Accounts
alias Todeux.TodoLists.List
alias Todeux.TodoLists.Todo
alias Todeux.TodoLists
alias Todeux.Repo

# users
Accounts.register_user(%{
  email: "first_user@internet.com",
  username: "First User",
  provider: nil,
  password: "longerpassword"
})

Accounts.register_user(%{
  email: "second_user@internet.com",
  username: "Second User",
  provider: nil,
  password: "longerpassword"
})

user_one = Repo.get!(User, 1)
user_two = Repo.get!(User, 2)

# lists

TodoLists.create_list(user_one, %{
  name: "first list"
})

TodoLists.create_list(user_one, %{
  name: "second list"
})

TodoLists.create_list(user_two, %{
  name: "third list"
})

TodoLists.create_list(user_two, %{
  name: "fourth list"
})

first_list = Repo.get!(List, 1)
second_list = Repo.get!(List, 2)
third_list = Repo.get!(List, 3)
fourth_list = Repo.get!(List, 4)

# todos
