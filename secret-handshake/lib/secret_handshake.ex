use Bitwise

defmodule SecretHandshake do
  @all_commands ["wink", "double blink", "close your eyes", "jump"]

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    result = @all_commands
    |> Enum.with_index
    |> Enum.filter(fn {_, i} -> (code &&& 1 <<< i) > 0 end)
    |> Enum.map(fn {v, _} -> v end)

    if (code &&& 0b10000) > 0, do: Enum.reverse(result), else: result
  end
end
