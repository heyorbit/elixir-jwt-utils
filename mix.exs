defmodule JwtTestUtils.MixProject do
  use Mix.Project

  def project do
    [
      app: :jwt_test_utils,
      version: "0.2.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      package: package(),
      description: description(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      name: "jwt_test_utils",
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Adrián Quintás"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/heyorbit/elixir-jwt-test-utils"}
    ]
  end

  defp description do
    "Test utils for app based JWT authentication"
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.16", only: :dev, runtime: false},
      {:excoveralls, "~> 0.8", only: :test},
      {:plug, "~> 1.5.1"},
      {:poison, "~> 3.1"},
      {:joken, "~> 1.5"}
    ]
  end

  defp aliases do
    [
      compile: ["compile --warnings-as-errors"]
    ]
  end
end
