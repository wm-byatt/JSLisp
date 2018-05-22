defmodule Jslisp do
  def main([file_name | _other_args]) do
    compile(file_name)
  end

  def compile(file_name) do
    {:ok, contents} = File.read(file_name)

    {:ok, tokens, _} =
      contents
      |> String.to_charlist()
      |> :lexer.string()

    tokens |> :parser.parse()
  end
end
