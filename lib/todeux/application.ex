defmodule Todeux.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Todeux.Repo,
      # Start the Telemetry supervisor
      TodeuxWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Todeux.PubSub},
      # Start the Endpoint (http/https)
      TodeuxWeb.Endpoint
      # Start a worker by calling: Todeux.Worker.start_link(arg)
      # {Todeux.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Todeux.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    TodeuxWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
