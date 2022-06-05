defmodule GalaxyProjectTest do
  use ExUnit.Case
  doctest GalaxyProject

  test "greets the world" do
    assert GalaxyProject.hello() == :world
  end
end
