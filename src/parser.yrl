
%%%
%%% Metadefinitions
%%%
Rootsymbol expression.
Nonterminals expression elems elem.
Terminals open_paren close_paren int string label.


%%%
%%% Grammar Rules
%%%
expression -> open_paren elems close_paren : '$2'.

elems -> elem elem : ['$1', '$2'].
elems -> elem elems : ['$1', '$2'].

elem -> expression : '$1'.
elem -> int : extract_token('$1').
elem -> string : extract_token('$1').
elem -> label : extract_token('$1').

Erlang code.

extract_token({_Token, _Line, Value}) -> Value.