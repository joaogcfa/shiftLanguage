%{
    extern int yylex();
    void yyerror(const char *s) { printf("ERROR: %sn", s); }
%}

/* Represents the many different ways we can access our data */
%union {
    std::string *string;
    int token;
}

/* Define our terminal symbols (tokens). This should
   match our tokens.l lex file. We also define the node type
   they represent.
 */
%token <string> TLETTER TDIGIT
%token <token> TCEQ TCNE TCLT TCGT TEQUAL TOR TAND
%token <token> TLPAREN TRPAREN TLBRACE TRBRACE TCOMMA TSEMICOL
%token <token> TPLUS TMINUS TMUL TDIV
%token <token> TIF TWHILE TPRINT TDEFINE TRETURN TELSE TSCAN


/* Operator precedence for mathematical operators */
%left TPLUS TMINUS
%left TMUL TDIV

%start block

%%

block   :   TLBRACE {statement} TRBRACE
        ;

defunc  :   TDEFINE identifier TLPAREN args TRPAREN block
        ;

funcall :   identifier TLPAREN args TRPAREN 
        ;

args    :   identifier {TCOMMA args} | 
        ;

return  :   TRETURN realexpression
        ;

statement   : state_op
            | TSEMICOL
            ;

state_op    : assignment 
            | print 
            | while 
            | if 
            | block 
            | return 
            | defunc 
            | funcall 
            ;

factor  : op_factor
        | number 
        | TLPAREN expression TRPAREN 
        | identifier 
        | TSCAN TLPAREN TRPAREN 
        ;


op_factor   : factor | factor_mat_op

factor_mat_op  : TPLUS
                | TMINUS
                | TCNE


term    :   factor { term_op factor}
        ;

term_op :   TMUL
        |   TDIV
        |   TAND


expression  :   term {expression_op  term}
            ;

expression_op :   TPLUS
                | TMINUS
                | TOR

realexpression  :   expression { realexpression_op expression}
                ;

realexpression_op   :   TCEQ
                    |   TCLT
                    |   TCGT

while   :   TWHILE TLPAREN realexpression TRPAREN statement
        ;

if      :   TIF TLPAREN realexpression  TRPAREN block if_op
        ;

if_op   :   else |
        ;

else    :   TELSE block
        ;

assignment  :   identifier TEQUAL expression 
            ;   

print   :   TPRINT TLPAREN expression TRPAREN
        ;

identifier  :   letter {letter | digit}
            ;

number  :   TDIGIT {TDIGIT}
        ;

letter  :   TLETTER
        ;

digit   :   TDIGIT
        ;




%%