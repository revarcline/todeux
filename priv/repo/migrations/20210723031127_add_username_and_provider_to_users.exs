defmodule Todeux.Repo.Migrations.AddUsernameAndProviderToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add(:username, :string)
      add(:provider, :string)
    end
  end
end
