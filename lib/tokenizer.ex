defmodule Jslisp.Tokenizer do

  #
  # Special characters
  #

  def tokenize("(" <> tail) do
    [{:paren, "("} | tokenize(tail)]
  end

  def tokenize(")") do
    [{:paren, ")"}]
  end

  def tokenize(")" <> tail) do
    [{:paren, ")"} | tokenize(tail)]
  end

  # def tokenize("\'" <> tail) do
  #   [{:quote, "\'"} | tokenize(tail)]
  # end

  def tokenize("\"" <> tail) do
    [{:quote, "\'"} | tokenize(tail)]
  end

  #
  # Whitespace is token-neutral
  #

  def tokenize(" " <> tail) do
    tokenize(tail)
  end

  def tokenize("\t" <> tail) do
    tokenize(tail)
  end

  def tokenize("\n" <> tail) do
    tokenize(tail)
  end

  def tokenize("\r" <> tail) do
    tokenize(tail)
  end

  #
  # Data!
  #

  def tokenize(input) do
    {sequence, tail} = input
    |> split_identifier

    [{token_for(sequence), sequence} | tokenize(tail)]
  end

  def split_identifier(input) do
    split_identifier("", input)
  end

  def split_identifier(identifier, <<head::bytes-size(1)>> <> tail) do
    cond do
      Regex.match?(~r/\w/, head) -> split_identifier(identifier <> head, tail)
      true -> {identifier, head <> tail}
    end
  end

  def token_for(sequence) do
    cond do
      Regex.match?(~r/\d+/, sequence) -> :numerals
      true -> :identifier
    end
  end
end
