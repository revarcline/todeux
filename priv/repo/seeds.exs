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
alias Todeux.TodoLists.List
alias Todeux.TodoLists.Todo

# users
Todeux.Repo.insert!(%User{
  email: "first_user@internet.com",
  username: "First User",
  provider: nil,
  password: "password"
})

Todeux.Repo.insert!(%User{
  email: "second_user@internet.com",
  username: "Second User",
  provider: nil,
  password: "password"
})

# lists
