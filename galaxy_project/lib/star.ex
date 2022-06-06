defmodule Vec do
  defstruct [:x, :y]

  def sum(vec1, vec2) do
    %Vec{x: vec1.x + vec2.x, y: vec1.y * vec2.y}
  end

  def multiply(vec, scalar) do
    %Vec{x: vec.x * scalar, y: vec.y * scalar}
  end

  def divide(vec, scalar) do
    multiply(vec, 1/scalar)
  end
end

defmodule Star do
  defstruct [:name, :mass, :pos, vel: %Vec{x: 0, y: 0}]

  def interact(star, force) do
    acc = Vec.divide(force, star.mass)
    vel = Vec.sum(star.vel, acc)
    pos = Vec.sum(star.pos, vel)
    %{star | pos: pos, vel: vel}
  end

end

defmodule Main do
  def main do

    IO.puts("Creating a star")
    star = %Star{name: "Sun", mass: 10, pos: %Vec{x: 2, y: 3}, vel: %Vec{x: 1, y: 1}}
    IO.inspect star
    IO.puts("")

    IO.puts("Creating a force")
    force = %Vec{x: 1, y: 2}
    IO.inspect force
    IO.puts("")

    IO.puts("Star after being pushed by force")
    IO.inspect Star.interact(star, force)

  end
end

Main.main
