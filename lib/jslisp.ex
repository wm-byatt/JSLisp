defmodule Jslisp do

  def main([file_name | _other_args]) do
    compile(file_name)
  end

  def compile(file_name) do
    {:ok, contents} = File.read(file_name)

    output = contents
    |> Jslisp.Tokenizer.tokenize
    |> Jslisp.AST.from_tokens
    |> Jslisp.Generator.from_ast

    :ok = File.write("out.js", output)

    {:ok, "out.js"}
  end
end
