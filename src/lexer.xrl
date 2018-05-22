Definitions.

OPEN_PAREN = \(
CLOSE_PAREN = \)
INT = [0-9]+
STRING = \".*\"
LABEL = [a-zA-Z_\-0-9]+
WHITESPACE = [\s\t\n\r]+

Rules.

{OPEN_PAREN}  : {token, {open_paren, TokenLine}}.
{CLOSE_PAREN} : {token, {close_paren, TokenLine}}.
{INT}         : {token, {int, TokenLine, TokenChars}}.
{STRING}      : {token, {string, TokenLine, TokenChars}}.
{LABEL}       : {token, {label, TokenLine, TokenChars}}.
{WHITESPACE}  : skip_token.

Erlang code.