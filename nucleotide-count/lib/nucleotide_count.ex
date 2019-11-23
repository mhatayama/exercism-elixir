defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide) do
    strand |> Enum.count(fn x -> x == nucleotide end)
  end

  @spec histogram(charlist()) :: map()
  def histogram(strand) do
    @nucleotides
    |> Enum.map(fn x -> {x, count(strand, x)} end)
    |> Enum.into(%{})
  end
end
