defmodule WorkspaceDemos.MixWorkspace do
    use Mix.Project

    def project do
      [
        app: :workspace_demos,
        version: "0.1.0",
        elixir: "~> 1.16",
        start_permanent: Mix.env() == :prod,
        deps: deps(),
        elixirc_paths: [],
        workspace: [
          type: :workspace
        ],
        lockfile: "workspace.lock"
      ]
    end

    # Run "mix help compile.app" to learn about applications.
    def application do
      [
        extra_applications: []
      ]
    end

    # Run "mix help deps" to learn about dependencies.
    defp deps do
      [
        # TODO: set proper versions once released
        {:workspace, github: "pnezis/workspace", sparse: "workspace"},
        {:cli_options, github: "pnezis/workspace", sparse: "cli_options", override: true}
      ]
    end
  end
