defmodule Justcall.MixProject do
  use Mix.Project

  @version "0.1.0"
  @url "https://github.com/christopherlai/justcall"
  @name "Justcall"

  def project do
    [
      app: :justcall,
      version: @version,
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      docs: docs(),
      package: package(),
      deps: deps()
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:credo, "~> 1.1.0", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.21.2", only: :dev, runtime: false},
      {:hackney, "~> 1.15", optional: true},
      {:jason, "~> 1.1", optional: true}
    ]
  end

  defp docs do
    [
      main: @name,
      source_ref: "v#{@version}",
      source_url: @url,
      extras: ["README.md"]
    ]
  end

  defp package() do
    [
      name: @name,
      files: ~w(lib config .formatter.exs mix.exs README*),
      licenses: ["MIT"],
      links: %{github: @url}
    ]
  end
end
