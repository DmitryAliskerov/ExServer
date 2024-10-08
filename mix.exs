defmodule Server.MixProject do
  use Mix.Project

  def project do
    [
      app: :server,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [mod: {Server, []},
     extra_applications: [:logger]]
  end

  # Run "mix help deps" to learn about dependencies
  defp deps do
    [{:plug, "~> 1.4"},
     {:plug_cowboy, "~> 1.0"}]
  end

  defp aliases do
    [
      setup: ["deps.get"]
    ]
  end
end
