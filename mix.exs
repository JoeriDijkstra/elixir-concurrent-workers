defmodule BettyLoggingService.MixProject do
  use Mix.Project

  def project do
    [
      app: :betty_logging_service,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {BettyLoggingService.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.3"},
      {:httpoison, "~> 1.8"},
      {:plug_cowboy, "~> 2.5"},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false}
    ]
  end
end
