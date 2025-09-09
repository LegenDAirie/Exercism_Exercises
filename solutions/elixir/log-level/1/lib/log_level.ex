defmodule LogLevel do
  def to_label(0, true), do: :unknown
  def to_label(5, true), do: :unknown
  def to_label(level, legacy?), do: code_to_log_label(level)

  def code_to_log_label(0), do: :trace
  def code_to_log_label(1), do: :debug
  def code_to_log_label(2), do: :info
  def code_to_log_label(3), do: :warning
  def code_to_log_label(4), do: :error
  def code_to_log_label(5), do: :fatal
  def code_to_log_label(code), do: :unknown

  def alert_recipient(0, true), do: :dev1
  def alert_recipient(4, legacy?), do: :ops
  def alert_recipient(5, false), do: :ops
  def alert_recipient(5, true), do: :dev1
  def alert_recipient(6, true), do: :dev1
  def alert_recipient(6, false), do: :dev2
  def alert_recipient(_code, _legacy?), do: false
end
