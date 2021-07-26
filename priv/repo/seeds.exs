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
alias Todeux.Repo

# users
Repo.insert!(
  User.registration_changeset(%User{}, %{
    email: "first_user@internet.com",
    username: "First User",
    provider: nil,
    password: "longerpassword"
  })
)

Repo.insert!(
  User.registration_changeset(%User{}, %{
    email: "second_user@internet.com",
    username: "Second User",
    provider: nil,
    password: "longerpassword"
  })
)

# lists
