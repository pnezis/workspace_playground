[
  # Add paths that shall not be considered when generating the workspace graph
  # By default deps and _build folders are ignored. You are advised to store all
  # build artifacts under a dedicated folder (e.g. artifacts) which should be ignored.
  ignore_paths: ~w[deps _build],

  # Custom workspace checks for linting your mono-repo at a package level. You can
  # enforce things like common build dirs or required project depenendencies. For
  # more details chech the `Workspace.Check` documentation.
  checks: [
    [
      module: Workspace.Checks.WorkspaceDepsPaths,
      description: "validate workspace relative path dependencies"
    ],
    [
      module: Workspace.Checks.ValidateConfig,
      description: "all projects must have a description set",
      opts: [
        validate: fn config ->
          case config[:description] do
            nil -> {:error, "no :description set"}
            description when is_binary(description) -> {:ok, ""}
            other -> {:error, "description must be binary, got: #{inspect(other)}"}
          end
        end
      ]
    ],
    [
      module: Workspace.Checks.ForbiddenDeps,
      description: "forbidden dependencies are not used",
      opts: [
        deps: [:poison]
      ]
    ],
    [
      module: Workspace.Checks.DependenciesVersion,
      description: "strict external dependencies",
      opts: [
        deps: [
          {:ex_doc, "== 0.28.3", no_options_check: true}
        ]
      ]
    ]
  ],

  # Test coverage settings on the workspace level.
  test_coverage: [
    # projects allowed to fail
    allow_failure: [],
    threshold: 60,
    warning_threshold: 70,
    # add coverage exporters
    exporters: []
  ]
]
