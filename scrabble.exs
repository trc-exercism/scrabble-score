defmodule Scrabble do

  @letter_score %{?A => 1, ?E => 1, ?I => 1, ?O => 1, ?U => 1, ?L => 1, ?N => 1, ?R => 1, ?S => 1, ?T => 1,
    ?D => 2, ?G => 2,
    ?B => 3, ?C => 3, ?M => 3, ?P => 3,
    ?F => 4, ?H => 4, ?V => 4, ?W => 4, ?Y => 4,
    ?K => 5,
    ?J => 8, ?X => 8,
    ?Q => 10, ?Z => 10}

  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(word) do
    _score(to_charlist(String.upcase(word)), 0)
  end

  defp _score([], acc), do: acc
  defp _score([h|t], acc) when h in ?A..?Z do
    _score(t, acc + @letter_score[h])
  end
  defp _score([h|t], acc), do: _score(t, acc)


end
