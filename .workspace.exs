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
      module: Workspace.Checks.ValidateProject,
      description: "all projects must have a description set",
      opts: [
        validate: fn project ->
          case project.config[:description] do
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
          ex_doc: [
            version: "== 0.28.3"
          ]
        ]
      ]
    ],
    # Tags related checks
    [
      module: Workspace.Checks.ValidateTags,
      description: "all projects must have valid tags",
      opts: [
        allowed: [
          {:scope, :shared},
          {:scope, :app},
          {:scope, :data},
          {:scope, :domain}
        ]
      ]
    ],
    [
      module: Workspace.Checks.RequiredScopeTag,
      description: "all projects must have a {:scope, value} tag set",
      opts: [
        scope: :scope
      ]
    ],
    [
      module: Workspace.Checks.EnforceBoundaries,
      description: "scope:shared layer can only depend on scope:shared",
      opts: [
        tag: {:scope, :shared},
        allowed_tags: [{:scope, :shared}]
      ]
    ],
    [
      module: Workspace.Checks.EnforceBoundaries,
      description: "scope:data layer can only depend on scope:shared",
      opts: [
        tag: {:scope, :data},
        allowed_tags: [{:scope, :shared}]
      ]
    ],
    [
      module: Workspace.Checks.EnforceBoundaries,
      description: "scope:domain layer can only depend on scope:data",
      opts: [
        tag: {:scope, :domain},
        allowed_tags: [{:scope, :data}]
      ]
    ],
    [
      module: Workspace.Checks.EnforceBoundaries,
      description: "scope:app layer can only depend on downstream packages",
      opts: [
        tag: {:scope, :app},
        allowed_tags: [{:scope, :data}, {:scope, :shared}]
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
