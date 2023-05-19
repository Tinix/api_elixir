defmodule MyApiTest do
  use ExUnit.Case
  doctest MyApi

  test "greets the world" do
    assert MyApi.hello() == :world
  end
end
