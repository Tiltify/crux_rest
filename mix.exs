defmodule Crux.Rest.MixProject do
  use Mix.Project

  @vsn "0.3.0-dev"
  @name :crux_rest

  def project do
    [
      start_permanent: Mix.env() == :prod,
      package: package(),
      app: @name,
      version: @vsn,
      elixir: "~> 1.10",
      description: "Package providing rest functions and rate limiting for the Discord API",
      source_url: "https://github.com/SpaceEEC/#{@name}/",
      homepage_url: "https://github.com/SpaceEEC/#{@name}/",
      deps: deps(),
      aliases: aliases(),
      docs: docs()
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
      # {:crux_structs, "~> 0.3"},
      {:crux_structs, github: "spaceeec/crux_structs"},
      {:httpoison, "~> 1.8"},
      {:jason, "~> 1.2"},
      {:ex_doc, "~> 0.25", only: :dev, runtime: false},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:mox, "~> 1.0", only: :test}
    ]
  end

  defp aliases() do
    []
  end

  defp docs() do
    groups = [
      "Application Commands": &(&1[:section] == :application_commands),
      User: &(&1[:section] == :user),
      Channel: &(&1[:section] == :channel),
      Message: &(&1[:section] == :message),
      Reaction: &(&1[:section] == :reaction),
      Guild: &(&1[:section] == :guild),
      Member: &(&1[:section] == :member),
      Role: &(&1[:section] == :role),
      Ban: &(&1[:section] == :ban),
      Invite: &(&1[:section] == :invite),
      Template: &(&1[:section] == :template),
      Emoji: &(&1[:section] == :emoji),
      Integration: &(&1[:section] == :integration),
      Webhook: &(&1[:section] == :webhook),
      Voice: &(&1[:section] == :voice),
      Gateway: &(&1[:section] == :gateway),
      OAuth2: &(&1[:section] == :oauth2)
    ]

    [
      groups_for_functions: groups,
      markdown_processor_options: [breaks: true],
      formatter: "html",
      # To make these very long function names readable
      # Comes at the cost of having a variable width sidebar
      before_closing_head_tag: fn :html ->
        """
        <style>
          .sidebar {
            width: unset;
            min-width: 300px;
          }
        </style>
        """
      end
    ]
  end
end
