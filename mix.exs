defmodule Money.Mixfile do
  use Mix.Project

  @version "0.0.16"

  def project do
    [app: :ex_money,
     version: @version,
     elixir: "~> 1.3",
     name: "Money",
     source_url: "https://github.com/kipcole9/money",
     docs: docs(),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     description: description(),
     package: package(),
     test_coverage: [tool: ExCoveralls],
     aliases: aliases(),
     elixirc_paths: elixirc_paths(Mix.env)
   ]
  end

  defp description do
    "Money functions for the serialization of and operations on a money data type."
  end

  defp package do
    [
      maintainers: ["Kip Cole"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/kipcole9/money"},
      files: [
        "lib", "config", "mix.exs", "README.md", "CHANGELOG.md", "LICENSE.md"
      ]
    ]
  end

  def application do
    [
      mod: {Money, []},
      applications: [:logger]
    ]
  end

  def docs do
    [
      source_ref: "v#{@version}",
      extras: ["README.md"],
      main: "readme"
    ]
  end

  def aliases do
    []
  end

  defp deps do
    [
      {:ex_cldr, "~> 0.1.0"},
      {:ecto, "~> 2.1", optional: true},
      {:excoveralls, "~> 0.5.6", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]
end
