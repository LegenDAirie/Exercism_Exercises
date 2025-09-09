defmodule LogLevel do
  def to_label(0, true), do: :unknown
  def to_label(5, true), do: :unknown
  def to_label(level, legacy?), do: code_to_log_label(level)

  def code_to_log_label(code) do
    cond do
      code == 0 -> :trace
      code == 1 -> :debug
      code == 2 -> :info
      code == 3 -> :warning
      code == 4 -> :error
      code == 5 -> :fatal
      true -> :unknown
    end
  end

  def alert_recipient(0, true), do: :dev1
  def alert_recipient(4, legacy?), do: :ops
  def alert_recipient(5, false), do: :ops
  def alert_recipient(5, true), do: :dev1
  def alert_recipient(6, true), do: :dev1
  def alert_recipient(6, false), do: :dev2
  def alert_recipient(_code, _legacy?), do: false
end
