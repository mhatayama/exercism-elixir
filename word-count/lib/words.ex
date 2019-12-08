defmodule Words do
  @splitter_regex ~r/[\s(\!-\,)(\:-\@)(\[-\`)]+/u

  @spec count(String.t()) :: map
  def count(sentence) do
    String.downcase(sentence)
    |> String.split(@splitter_regex, trim: true)
    |> Enum.group_by(&(&1))
    |> Enum.into(%{}, fn {k, v} -> {k, length(v)} end)
  end
end
