defmodule Jslisp.Generator do

  # End of program
  def from_ast([]) do
    ""
  end

  # Nodes with children, including root node
  def from_ast([head | tail]) do
    from_ast(head) <> from_ast(tail)
  end

  def from_ast(%{type: "S-Expression", value: [func_name | args]}) do
    argument_expression = args
    |> Enum.map(fn(node) -> from_ast(node) end)
    |> Enum.join(",")

    "#{from_ast(func_name)}(#{argument_expression})"
  end

  def from_ast(%{type: "Identifier", value: value}) do
    "#{value}"
  end

  def from_ast(%{type: "String", value: value}) do
    "\"#{value}\""
  end

  def from_ast(%{type: "Numerals", value: value}) do
    "#{value}"
  end
end
