defmodule BirdCount do
  def today([]), do: nil
  def today([todays_bird_count | _rest]), do: todays_bird_count

  def increment_day_count([]), do: [1]
  def increment_day_count([bird_count | rest]), do: [bird_count + 1 | rest]

  def has_day_without_birds?(birds_seen), do: 0 in birds_seen

  def total([]), do: 0
  def total([bird_count | rest]), do: bird_count + total(rest)

  def busy_days([]), do: 0
  def busy_days([bird_count | rest]) when bird_count >= 5, do: 1 + busy_days(rest)
  def busy_days([_bird_count | rest]), do: busy_days(rest)
end
