# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :todeux, Todeaux.Repo,
  database: "todeux_repo",
  username: "user",
  password: "pass",
  hostname: "localhost"

config :todeux,
  ecto_repos: [Todeux.Repo]

# Configures the endpoint
config :todeux, TodeuxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4hlXsV5+/eVnFzAJiyqCXjMYmzKCzcz7caqxW8VwZCJOtZq5vDysXhRsTObtXag+",
  render_errors: [view: TodeuxWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Todeux.PubSub,
  live_view: [signing_salt: "o3498c+/"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
