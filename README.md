# Shift Language

EBNF:

BLOCK = "{", { STATEMENT }, "}" ;

DEFUNC = "D", IDENTIFIER, "(", [ ARGS ] , ")", BLOCK;

FUNCALL = IDENTIFIER, "(", [ARGS], ")";

ARGS = IDENTIFIER, ("," , "IDENTIFIER");

RETURN = "R", REALEXPRESSION;

STATEMENT = ( λ | ASSIGNMENT | PRINT | WHILE | IF | BLOCK | RETURN | DEFUNC | FUNCALL) ;

ASSIGNMENT = IDENTIFIER, "=", EXPRESSION, ";" ;

PRINT = "P", "(", EXPRESSION, ")", ";" ;

WHILE = "W", "(", REALEXPRESSION, ")". STATEMENT ;

IF = "I", "(", REALEXPRESSION, ")". STATEMENT | "I", "(", REALEXPRESSION, ")". STATEMENT, ELSE;

ELSE = "E", STATEMENT;

REALEXPRESSION = EXPRESSION, { ("==" | "<" | ">"), TERM } ;

EXPRESSION = TERM, { ("+" | "-" | "O"), TERM } ;

TERM = FACTOR, { ("*" | "/" | "A"), FACTOR } ;

FACTOR = (("+" | "-" | "N"), FACTOR) | NUMBER | "(", EXPRESSION, ")" | IDENTIFIER | "S", "(", ")" ;

IDENTIFIER = LETTER, { LETTER | DIGIT | "_" } ;

NUMBER = DIGIT, { DIGIT } ;

LETTER = ( a | ... | z ) ;

DIGIT = ( 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 ) ;
