defmodule Words do
  @punctuation_regex ~r/[^\w\s\_\-]/u
  @splitter_regex ~r/[\s\_]+/u

  @spec count(String.t()) :: map
  def count(sentence) do
    String.downcase(sentence)
    |> String.replace(@punctuation_regex, "")
    |> String.split(@splitter_regex)
    |> Enum.group_by(&(&1))
    |> Enum.into(%{}, fn {k, v} -> {k, length(v)} end)
  end
end
