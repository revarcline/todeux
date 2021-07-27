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
alias Todeux.Accounts
alias Todeux.Accounts.User
alias Todeux.TodoLists
alias Todeux.TodoLists.List
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

user_one =
  User
  |> Repo.get!(1)

user_two =
  User
  |> Repo.get!(2)

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

first_list =
  List
  |> Repo.get!(1)
  |> Repo.preload(:user)

second_list =
  List
  |> Repo.get!(2)
  |> Repo.preload(:user)

third_list =
  List
  |> Repo.get!(3)
  |> Repo.preload(:user)

fourth_list =
  List
  |> Repo.get!(3)
  |> Repo.preload(:user)

# todolists!

TodoLists.create_todo(first_list.user, first_list, %{
  name: "Eat breakfast",
  done: false
})

TodoLists.create_todo(first_list.user, first_list, %{
  name: "Eat lunch",
  done: false
})

TodoLists.create_todo(first_list.user, first_list, %{
  name: "Eat dinner",
  done: false
})

TodoLists.create_todo(second_list.user, second_list, %{
  name: "Fly in a plane",
  done: false
})

TodoLists.create_todo(second_list.user, second_list, %{
  name: "Ride a bike",
  done: false
})

TodoLists.create_todo(second_list.user, second_list, %{
  name: "Run a mile",
  done: false
})

TodoLists.create_todo(third_list.user, third_list, %{
  name: "Figure out Ecto associations",
  done: false
})

TodoLists.create_todo(third_list.user, third_list, %{
  name: "Get a grip on LiveView",
  done: false
})

TodoLists.create_todo(third_list.user, third_list, %{
  name: "Create halfway decent controller actions",
  done: false
})

TodoLists.create_todo(fourth_list.user, fourth_list, %{
  name: "Do some dishes",
  done: false
})

TodoLists.create_todo(fourth_list.user, fourth_list, %{
  name: "Clean the rug",
  done: false
})

TodoLists.create_todo(fourth_list.user, fourth_list, %{
  name: "Sift the cat litter",
  done: false
})
