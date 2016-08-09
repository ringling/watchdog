defmodule Watchdog.Mixfile do
  use Mix.Project

  def project do
    [app: :watchdog,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:logger, :quantum]]
  end

  defp deps do
    [
      {:quantum, ">= 1.7.1"},
      {:uuid, "~> 1.1"}
    ]
  end
end
