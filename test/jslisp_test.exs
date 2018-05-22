defmodule JslispTest do
  use ExUnit.Case
  doctest Jslisp

  test "Generates correct AST nested S-Expressions" do
    input = "(someFunction (arg1 arg2) (arg3 arg4))"
    target = [
      %{
        type: "S-Expression",
        value: [
          %{type: "Identifier", value: "someFunction"},
          %{
            type: "S-Expression",
            value: [
              %{type: "Numerals", value: "arg1"},
              %{type: "Numerals", value: "arg2"},
            ]
          },
          %{
            type: "S-Expression",
            value: [
              %{type: "Numerals", value: "arg3"},
              %{type: "Numerals", value: "arg4"},
            ]
          }
        ]
      }
    ]

    assert input |> Jslisp.Tokenizer.tokenize |> Jslisp.AST.from_tokens == target
  end
end
