defmodule Vec do
  defstruct [:x, :y]

  def sum(vec1, vec2) do
    %Vec{x: vec1.x + vec2.x, y: vec1.y * vec2.y}
  end

  def sub(vec1, vec2) do
    sum(vec1, multiply(vec2, -1))
  end

  def multiply(vec, scalar) do
    %Vec{x: vec.x * scalar, y: vec.y * scalar}
  end

  def divide(vec, scalar) do
    multiply(vec, 1/scalar)
  end

  def distance(vec1, vec2) do
    result = sub(vec1, vec2)
    (result.x**2 + result.y**2)**(1/2)
  end
end

defmodule Star do
  defstruct [:name, :mass, :pos, vel: %Vec{x: 0, y: 0}]

  def push(star, force) do
    acc = Vec.divide(force, star.mass)
    vel = Vec.sum(star.vel, acc)
    pos = Vec.sum(star.pos, vel)
    %{star | pos: pos, vel: vel}
  end

  def interact(star1, star2) do
    g = 2
    dist = Vec.distance(star1.pos, star2.pos)
    force_intenisty = (g*star1.mass*star2.mass) / (dist**3) # https://en.wikipedia.org/wiki/Newton%27s_law_of_universal_gravitation
    f12 = Vec.multiply(Vec.sub(star2.pos, star1.pos), force_intenisty)
    push(star1, f12)
  end

end

defmodule Main do
  def main do

    IO.puts("Creating a star")
    star1 = %Star{name: "Sun", mass: 10, pos: %Vec{x: 20, y: 30}, vel: %Vec{x: 10, y: 15}}
    IO.inspect star1
    IO.puts("")

    IO.puts("Creating a force")
    force = %Vec{x: 1, y: 2}
    IO.inspect force
    IO.puts("")

    IO.puts("Star after being pushed by force")
    IO.inspect Star.push(star1, force)

    IO.puts("Creating another star")
    star2 = %Star{name: "Alpha centauri", mass: 20, pos: %Vec{x: 30, y: 50}, vel: %Vec{x: 20, y: -10}}
    IO.inspect star2
    IO.puts("")

    IO.puts("Interacting")
    Star.interact(star1, star2)
    IO.inspect Star.interact(star1, star2)
    IO.inspect Star.interact(star2, star1)
    IO.puts("")

  end
end

Main.main
