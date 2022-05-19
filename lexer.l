%{
#include <string>
#include "parser.hpp"
#define SAVE_TOKEN yylval.string = new std::string(yytext, yyleng)
#define TOKEN(t) (yylval.token = t)
extern "C" int yywrap() { }
%}

%%

[ \t\n]                 ;
[a-z_]                  SAVE_TOKEN; return TLETTER;
[0-9]                   SAVE_TOKEN; return TDIGIT;
"="                     return TOKEN(TEQUAL);
"=="                    return TOKEN(TCEQ);
"N"                     return TOKEN(TCNE);
"<"                     return TOKEN(TCLT);
">"                     return TOKEN(TCGT);
"("                     return TOKEN(TLPAREN);
")"                     return TOKEN(TRPAREN);
"{"                     return TOKEN(TLBRACE);
"}"                     return TOKEN(TRBRACE);
","                     return TOKEN(TCOMMA);
"+"                     return TOKEN(TPLUS);
"-"                     return TOKEN(TMINUS);
"*"                     return TOKEN(TMUL);
"/"                     return TOKEN(TDIV);
";"                     return TOKEN(TSEMICOL);
"O"                     return TOKEN(TOR);
"A"                     return TOKEN(TAND);
"I"                     return TOKEN(TIF);
"E"                     return TOKEN(TELSE);
"W"                     return TOKEN(TWHILE);
"P"                     return TOKEN(TPRINT);
"D"                     return TOKEN(TDEFINE);
"R"                     return TOKEN(TRETURN);
"S"                     return TOKEN(TSCAN);

.                       printf("Unknown token!n"); yyterminate();

%%