defmodule PlanningPoker.MixProject do
  use Mix.Project

  def project do
    [
      app: :planning_poker,
      version: "0.1.0",
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      dialyzer: dialyzer(),
      preferred_cli_env: preferred_cli_env(),
      test_coverage: [tool: ExCoveralls]
    ]
  end

  def application do
    [
      mod: {PlanningPoker.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:phoenix, "~> 1.7.0-rc.2", override: true},
      {:phoenix_html, "~> 3.0"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_view, "~> 0.18.3"},
      {:heroicons, "~> 0.5"},
      {:floki, ">= 0.30.0", only: :test},
      {:phoenix_live_dashboard, "~> 0.7.2"},
      {:esbuild, "~> 0.5", runtime: Mix.env() == :dev},
      {:tailwind, "~> 0.1.8", runtime: Mix.env() == :dev},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 1.0"},
      {:gettext, "~> 0.20"},
      {:jason, "~> 1.2"},
      {:plug_cowboy, "~> 2.5"},
      {:credo, "~> 1.6", only: [:test, :dev], runtime: false},
      {:dialyxir, "~> 1.2", only: [:test, :dev], runtime: false},
      {:mix_audit, "~> 2.0", only: [:dev, :test], runtime: false},
      {:sobelow, "~> 0.11", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.15.3", only: :test}
    ]
  end

  defp aliases do
    [
      check: ["credo --strict", "dialyzer"],
      serve: "phx.server",
      setup: ["deps.get", "assets.setup"],
      "assets.setup": ["tailwind.install --if-missing", "esbuild.install --if-missing"],
      "assets.deploy": ["tailwind default --minify", "esbuild default --minify", "phx.digest"],
      tt: "test --trace",
      "test.slow": "test --slowest 10"
    ]
  end

  defp preferred_cli_env do
    [
      coveralls: :test,
      "coveralls.detail": :test,
      "coveralls.post": :test,
      "coveralls.html": :test,
      "test.slow": :test,
      tt: :test
    ]
  end

  defp dialyzer do
    [
      ignore_warnings: ".dialyzer_ignore.exs",
      plt_add_apps: [:ex_unit, :mix],
      plt_add_deps: :app_tree,
      plt_file: {:no_warn, "priv/plts/planning_poker_1_14_3_otp_25_2_2.plt"}
    ]
  end
end
