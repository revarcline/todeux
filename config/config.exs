# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

google_redirect_uri =
  System.get_env("GOOGLE_REDIRECT_URI") ||
    raise """
    environment variable GOOGLE_REDIRECT_URI is missing.
    """

google_client_id =
  System.get_env("GOOGLE_CLIENT_ID") ||
    raise """
    environment variable GOOGLE_CLIENT_ID is missing.
    """

google_client_secret =
  System.get_env("GOOGLE_CLIENT_SECRET") ||
    raise """
    environment variable GOOGLE_CLIENT_SECRET is missing.
    """

github_redirect_uri =
  System.get_env("GITHUB_REDIRECT_URI") ||
    raise """
    environment variable GITHUB_REDIRECT_URI is missing.
    """

github_client_id =
  System.get_env("GITHUB_CLIENT_ID") ||
    raise """
    environment variable GITHUB_CLIENT_ID IS missing.
    """

github_client_secret =
  System.get_env("GITHUB_CLIENT_SECRET") ||
    raise """
    environment variable GITHUB_CLIENT_SECRET is missing.
    """

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

config :ueberauth, Ueberauth,
  providers: [
    github: {Ueberauth.Strategy.Github, []},
    google: {Ueberauth.Strategy.Google, []}
  ]

config :ueberauth, Ueberauth.Strategy.Google.Oauth,
  client_id: google_client_id,
  client_secret: google_client_secret,
  redirect_uri: google_redirect_uri

config :ueberauth, Ueberauth.Strategy.Github.Oauth,
  client_id: github_client_id,
  client_secret: github_client_secret,
  redirect_uri: github_redirect_uri

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
