defmodule Strain do
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun), do: filter(list, fun)

  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun), do: keep(list, &(!fun.(&1)))

  defp filter([], _), do: []
  defp filter([head | tail], fun) do
    cond do
      fun.(head) -> [head | filter(tail, fun)]
      true -> filter(tail, fun)
    end
  end
end
