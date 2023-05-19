defmodule MyApi.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      MyApi.Router
    ]

    opts = [strategy: :one_for_one, name: MyApi.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

