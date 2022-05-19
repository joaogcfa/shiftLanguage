%{
    extern int yylex();
    void yyerror(const char *s) { printf("ERROR: %sn", s); }
    #include<string>
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
statement   : state_op
            | TSEMICOL
            ;

block   :   TLBRACE stmt_block TRBRACE
        ;

stmt_block : | stmt_block statement 
        ;

defunc  :   TDEFINE identifier TLPAREN args TRPAREN block
        ;

funcall :   identifier TLPAREN args TRPAREN 
        ;

args    :   identifier args_db 
        ;

args_db :   | args_db TCOMMA args
        ;

return  :   TRETURN realexpression
        ;



state_op    : assignment 
            | print 
            | while 
            | if 
            | block 
            | return 
            | defunc 
            | funcall 
            |
            ;

factor  : op_factor
        | number 
        | TLPAREN expression TRPAREN 
        | identifier 
        | TSCAN TLPAREN TRPAREN 
        ;


op_factor   : factor_mat_op factor 
            ;

factor_mat_op  : TPLUS
                | TMINUS
                | TCNE
                ;

term    :   factor repeat_term 
        ;

repeat_term :  | repeat_term term_op factor
            ;


term_op :   TMUL
        |   TDIV
        |   TAND
        ;


expression  :   term repeat_exp
            ;

repeat_exp :  | repeat_exp expression_op term 
           ;

expression_op :   TPLUS
                | TMINUS
                | TOR
                ;

realexpression  :   expression repeat_real
                ;

repeat_real     :       |       repeat_exp realexpression_op expression
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

identifier  :   letter repeat_ident
            ;

repeat_ident:       | repeat_ident letter digit
            ;

number  :   TDIGIT repeat_number
        ;
repeat_number :  |  repeat_number TDIGIT

letter  :   TLETTER
        ;

digit   :   TDIGIT
        ;




%%