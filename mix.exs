defmodule Crux.Rest.MixProject do
  use Mix.Project

  @vsn "0.2.0-dev"
  @name :crux_rest

  def project do
    [
      start_permanent: Mix.env() == :prod,
      package: package(),
      app: @name,
      version: @vsn,
      elixir: "~> 1.6",
      description: "Package providing rest functions and rate limiting for the Discord API",
      source_url: "https://github.com/SpaceEEC/#{@name}/",
      homepage_url: "https://github.com/SpaceEEC/#{@name}/",
      deps: deps()
    ]
  end

  def package do
    [
      name: @name,
      licenses: ["MIT"],
      maintainers: ["SpaceEEC"],
      links: %{
        "GitHub" => "https://github.com/SpaceEEC/#{@name}/",
        "Changelog" => "https://github.com/SpaceEEC/#{@name}/releases/tag/#{@vsn}",
        "Documentation" => "https://hexdocs.pm/#{@name}/#{@vsn}",
        "Unified Development Documentation" => "https://crux.randomly.space/"
      }
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      # TODO: Depend on v2 as soon as released
      {:crux_structs, git: "https://github.com/spaceeec/crux_structs.git"},
      {:httpoison, "~> 1.1.1"},
      {:timex, "~> 3.2.2"},
      {:poison, "~> 3.1.0"},
      {:ex_doc,
       git: "https://github.com/spaceeec/ex_doc",
       branch: "feat/umbrella",
       only: :dev,
       runtime: false},
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false}
    ]
  end
end
