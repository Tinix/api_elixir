defmodule MyApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :my_api,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:joken, "~> 2.3"},
      {:plug, "~>1.14.2"}
    ]
  end
end
