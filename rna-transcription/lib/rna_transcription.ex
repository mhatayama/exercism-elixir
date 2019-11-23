defmodule RnaTranscription do
  @trans_map %{?G => ?C, ?C => ?G, ?T => ?A, ?A => ?U}

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    for n <- dna, do: @trans_map[n]
  end
end
