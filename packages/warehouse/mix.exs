defmodule Warehouse.MixProject do
  use Mix.Project

  def project do
    [
      app: :warehouse,
      description: "the data layer",
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      workspace: [
        tags: [{:scope, :data}]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_utils, path: "../ecto_utils"}
    ]
  end
end
