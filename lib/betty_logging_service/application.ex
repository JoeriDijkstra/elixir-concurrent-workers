defmodule BettyLoggingService.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Router.Router, options: [port: 4001]},
      {StateServer.Server, %{}}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BettyLoggingService.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
