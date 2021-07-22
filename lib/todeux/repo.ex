defmodule Todeux.Repo do
  use Ecto.Repo,
    otp_app: :todeux,
    adapter: Ecto.Adapters.Postgres
end
