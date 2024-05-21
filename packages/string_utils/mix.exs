defmodule StringUtils.MixProject do
  use Mix.Project

  def project do
    [
      app: :string_utils,
      description: "string utilities",
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      workspace: [
        tags: [{:scope, :shared}]
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
      {:ex_doc, "== 0.30.0"}
    ]
  end
end
