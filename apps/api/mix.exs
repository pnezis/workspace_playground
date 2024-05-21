defmodule Api.MixProject do
  use Mix.Project

  def project do
    [
      app: :api,
      description: "the API",
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      workspace: [
        tags: [{:scope, :app}]
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
      {:accounts, path: "../../packages/accounts"},
      {:cli_tools, path: "../../packages/cli_tools"},
      {:orders, path: "../../packages/orders"}
    ]
  end
end
