# [
#   paren: "(",
#   identifier: "foo",
#   identifier: "foo",
#   paren: "(",
#   identifier: "bar",
#   identifier: "bar",
#   identifier: "bar",
#   paren: ")",
#   paren: ")"
# ]
#
# [%{
#   type: "S-Expression",
#   value: [
#     %{type: "Identifer", value: "foo"},
#     %{type: "Identifer", value: "foo"},
#     %{
#       type: "S-Expression",
#       value: [
#         %{type: "Identifer", value: "bar"},
#         %{type: "Identifer", value: "bar"},
#         %{type: "Identifer", value: "bar"},
#       ]
#     }
#   ]
# }]
#

defmodule Jslisp.AST do
  def from_tokens([{:paren, "("} | tail]) do
    [%{
      type: "S-Expression",
      value: from_tokens(tail)
    }]
  end

  def from_tokens([{:numerals, numerals} | tail]) do
    node = %{
      type: "Numerals",
      value: numerals
    }

    [node | from_tokens(tail)]
  end

  def from_tokens([{:identifier, identifier} | tail]) do
    node = %{
      type: "Identifier",
      value: identifier
    }

    [node | from_tokens(tail)]
  end

  def from_tokens([{:quote, _quote} | tail]) do
    {string, remainder} = extract_string(tail)
    node = %{
      type: "String",
      value: string
    }

    [node | from_tokens(remainder)]
  end



  def from_tokens([{:paren, ")"} | _tail]) do
    []
  end

  defp extract_string([{_ident, value} | tail ]) do
    extract_string(value, tail)
  end

  defp extract_string(string, [{:quote, _quote} | tail]) do
    {string, tail}
  end

  defp extract_string(string, [{_ident, value} | tail ]) do
    extract_string(string <> value, tail)
  end
end
