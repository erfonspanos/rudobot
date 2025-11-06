defmodule RudoBot.MixProject do
  use Mix.Project

  def project do
    [
      app: :rudobot,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {RudoBot.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
     {:nostrum, "~> 0.7"},
     {:tesla, "~> 1.4"},
     {:jason, "~> 1.2"}
    ]
  end
end
