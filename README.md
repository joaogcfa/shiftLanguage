# Shift Language

EBNF:

PROGRAM = (DECLARATION);

BLOCK = "{", { STATEMENT }, "}" ;

DEFUNC = TYPE, IDENTIFIER, "(", [ ARGS ] , ")", BLOCK;

ARGS = TYPE, REALEXPRESSION, {"," , TYPE, REALEXPRESSION};

FUNCALL = IDENTIFIER, "(", [ARGS], ")";

RETURN = "R", "(", REALEXPRESSION, ")";

STATEMENT = ( λ | ASSIGNMENT | PRINT | WHILE | IF | BLOCK | RETURN | DEFUNC | FUNCALL), ";" ;

ASSIGNMENT = IDENTIFIER, "=", EXPRESSION ;

PRINT = "P", "(", EXPRESSION, ")" ;

WHILE = "W", "(", REALEXPRESSION, ")", STATEMENT ;

IF = "I", "(", REALEXPRESSION, ")", BLOCK, (ELSE | λ);

ELSE = "E", BLOCK;

REALEXPRESSION = EXPRESSION, { ("==" | "<" | ">"), EXPRESSION } ;

EXPRESSION = TERM, { ("+" | "-" | "O" | "."), TERM } ;

TERM = FACTOR, { ("\*" | "/" | "A" |), FACTOR } ;

FACTOR = (("+" | "-" | "N"), FACTOR) | NUMBER | "(", EXPRESSION, ")" | IDENTIFIER | "S", "(", ")" ;

IDENTIFIER = LETTER, { LETTER | DIGIT } ;

NUMBER = DIGIT, { DIGIT } ;

LETTER = ( a | ... | z ) ;

DIGIT = ( 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 ) ;

TYPE = (IN |ST |V );
