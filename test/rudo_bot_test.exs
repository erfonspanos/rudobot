defmodule RudoBotTest do
  use ExUnit.Case
  doctest RudoBot

  test "greets the world" do
    assert RudoBot.hello() == :world
  end
end
