defmodule Rules do
  @doc """
  Returns a boolean value if Pac-Man is able to eat the ghost

  iex> Rules.eat_ghost?(false, true)
  false
  """
  def eat_ghost?(power_pellet_active, touching_ghost) do
    power_pellet_active and touching_ghost
  end

  @doc """
  Should return true if Pac-Man is touching a power pellet or a dot

  iex> Rules.score?(false, false)
  false
  """
  def score?(touching_power_pellet, touching_dot) do
    touching_power_pellet or touching_dot
  end

  @doc """
  Should return true if Pac-Man is touching a ghost and does not have a power pellet active

  iex> Rules.lose?(true, true)
  false
  iex> Rules.lose?(true, false)
  false
  iex> Rules.lose?(false, true)
  true
  iex> Rules.lose?(false, false)
  false
  """
  def lose?(false, true), do: true
  def lose?(_power_pellet_active, _touching_ghost), do: false

  @doc """
  Should return true if Pac-Man has eaten all of the dots and has not lost

  iex> Rules.win?(true, false, true)
  false
  iex> Rules.win?(true, true, false)
  true
  iex> Rules.win?(false, false, false)
  false
  """
  def win?(has_eaten_all_dots, power_pellet_active, touching_ghost) do
    has_eaten_all_dots and not lose?(power_pellet_active, touching_ghost)
  end
end
