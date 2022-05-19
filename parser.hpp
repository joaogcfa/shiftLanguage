/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     TLETTER = 258,
     TDIGIT = 259,
     TCEQ = 260,
     TCNE = 261,
     TCLT = 262,
     TCGT = 263,
     TEQUAL = 264,
     TOR = 265,
     TAND = 266,
     TLPAREN = 267,
     TRPAREN = 268,
     TLBRACE = 269,
     TRBRACE = 270,
     TCOMMA = 271,
     TSEMICOL = 272,
     TPLUS = 273,
     TMINUS = 274,
     TMUL = 275,
     TDIV = 276,
     TIF = 277,
     TWHILE = 278,
     TPRINT = 279,
     TDEFINE = 280,
     TRETURN = 281,
     TELSE = 282,
     TSCAN = 283
   };
#endif
/* Tokens.  */
#define TLETTER 258
#define TDIGIT 259
#define TCEQ 260
#define TCNE 261
#define TCLT 262
#define TCGT 263
#define TEQUAL 264
#define TOR 265
#define TAND 266
#define TLPAREN 267
#define TRPAREN 268
#define TLBRACE 269
#define TRBRACE 270
#define TCOMMA 271
#define TSEMICOL 272
#define TPLUS 273
#define TMINUS 274
#define TMUL 275
#define TDIV 276
#define TIF 277
#define TWHILE 278
#define TPRINT 279
#define TDEFINE 280
#define TRETURN 281
#define TELSE 282
#define TSCAN 283




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 7 "parser.y"
{
    std::string *string;
    int token;
}
/* Line 1529 of yacc.c.  */
#line 110 "parser.hpp"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

