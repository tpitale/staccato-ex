defmodule Staccato.Mixfile do
  use Mix.Project

  def project do
    [
      app: :staccato,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      source_url: "https://github.com/tpitale/staccato-ex",
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpoison]
    ]
  end

  defp description do
    "Google Analytics Collection API in Elixir"
  end

  defp package do
    [
      maintainers: ["Tony Pitale"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/tpitale/staccato-ex"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:poison, "~> 3.1"},
      {:httpoison, "~> 1.2"},
      {:elixir_uuid, "~> 1.2"}
    ]
  end
end
