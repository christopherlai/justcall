defmodule Justcall.MixProject do
  use Mix.Project

  def project do
    [
      app: :justcall,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
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
end
