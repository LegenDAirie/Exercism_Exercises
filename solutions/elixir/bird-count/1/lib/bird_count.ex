defmodule BirdCount do
  def today([]), do: nil
  def today([todays_bird_count | _rest]), do: todays_bird_count

  def increment_day_count([]), do: [1]
  def increment_day_count([bird_count | rest]), do: [bird_count + 1 | rest]

  def has_day_without_birds?(birds_seen), do: 0 in birds_seen

  def total(birds_seen), do: total_birds(birds_seen, 0)

  def busy_days(birds_seen), do: busy_day_count(birds_seen, 0)

  defp busy_day_count([], busy_days), do: busy_days
  defp busy_day_count([bird_count | rest], busy_days) when bird_count >= 5 do 
    busy_day_count(rest, busy_days + 1)
  end
  defp busy_day_count([bird_count | rest], busy_days), do: busy_day_count(rest, busy_days)

  defp total_birds([], birds), do: birds
  defp total_birds([ bird_count | rest], birds), do: total_birds(rest, bird_count + birds)
end
