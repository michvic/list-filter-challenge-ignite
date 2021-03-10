defmodule ListFilter do
  def call(list) do
    Enum.count(list, fn elem ->
      elem
      |> convert_to_integer()
      |> is_odd()
    end)
  end

  defp convert_to_integer(string) do
    case Integer.parse(string) do
      {int, _rest} -> {:ok, int}
      :error -> {:error, "it's not a number"}
    end
  end

  defp is_odd({:ok, number}) do
    rem(number, 2) != 0
  end

  defp is_odd({:error, _reason}) do
    false
  end
end
