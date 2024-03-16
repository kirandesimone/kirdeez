defmodule Kirdeez.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      KirdeezWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:kirdeez, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Kirdeez.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Kirdeez.Finch},
      # Start a worker by calling: Kirdeez.Worker.start_link(arg)
      # {Kirdeez.Worker, arg},
      # Start to serve requests, typically the last entry
      KirdeezWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Kirdeez.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    KirdeezWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
