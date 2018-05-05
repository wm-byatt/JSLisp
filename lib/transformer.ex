# [
#   %{
#     type: "S-Expression",
#     value: [
#       %{type: "Identifier", value: "foo"},
#       %{type: "Identifier", value: "foo"},
#       %{
#         type: "S-Expression",
#         value: [
#           %{type: "Identifier", value: "bar"},
#           %{type: "Identifier", value: "bar"},
#           %{type: "Identifier", value: "bar"}
#         ]
#       }
#     ]
#   }
# ]
#

defmodule Jslisp.Transformer do
  def from_lisp_ast(ast) do
    ast
  end
end
