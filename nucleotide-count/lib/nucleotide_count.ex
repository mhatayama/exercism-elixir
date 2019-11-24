defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide) do
    strand |> Enum.count(&(&1 == nucleotide))
  end

  @spec histogram(charlist()) :: map()
  def histogram(strand) do
    @nucleotides
    |> Enum.into(%{}, fn x -> {x, count(strand, x)} end)
  end
end
