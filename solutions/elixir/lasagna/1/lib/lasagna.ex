defmodule Lasagna do
  @doc """
  Returns how many minutes the lasagna should be in the oven

  iex> Lasagna.expected_minutes_in_oven()
  40
  """
  def expected_minutes_in_oven(), do: 40

  @doc """
  Takes the actual minutes the lasagna has been in the oven as a argument and
  returns how many minutes the lasagna still has to remain in the oven

  iex> Lasagna.remaining_minutes_in_oven(11)
  29
  iex> Lasagna.remaining_minutes_in_oven(55)
  -15
  """
  def remaining_minutes_in_oven(min_in_oven) do
    expected_minutes_in_oven() - min_in_oven
  end

  @doc """
  Takes the number of layers you added to the lasagna as a argument and returns
  how many minutes you spent preparing the lasagna, assuming each layer takes
  you 2 minutes to prepare

  iex> Lasagna.preparation_time_in_minutes(3)
  6
  """
  def preparation_time_in_minutes(number_of_layers), do: number_of_layers * 2

  @doc """
  Takes two arguments
  First Argument: number of layers you added to the lasagna
  Second Argument: is the number of minutes the lasagna has been in the oven
  Returns: How many minutes in total you've worked on cooking the lasagna

  iex> Lasagna.total_time_in_minutes(3, 20)
  26
  """
  def total_time_in_minutes(number_of_layers, min_in_oven) do
    preparation_time_in_minutes(number_of_layers) + min_in_oven
  end

  @doc """
  Does not take any arguments and returns a message indicating that the lasagna
  is ready to eat

  iex> Lasagna.alarm()
  "Ding!"
  """
  def alarm(), do: "Ding!"
end
