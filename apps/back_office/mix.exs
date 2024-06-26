defmodule BackOffice.MixProject do
  use Mix.Project

  def project do
    [
      app: :back_office,
      description: "back office",
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      workspace: [
        tags: [{:scope, :app}, :other]
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
      {:cli_tools, path: "../../packages/cli_tools"}
    ]
  end
end
