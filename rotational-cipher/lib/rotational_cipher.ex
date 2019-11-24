defmodule RotationalCipher do
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    to_charlist(text)
    |> Enum.map(&shifter(&1, shift))
    |> to_string()
  end

  defp shifter(x, shift) when x in ?a..?z, do: rem(x - ?a + shift, 26) + ?a
  defp shifter(x, shift) when x in ?A..?Z, do: rem(x - ?A + shift, 26) + ?A
  defp shifter(x, _), do: x
end
