%{
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
  #include "Ex1.tab.h"
  
  extern int errors;
%}

%option nounput
%option noinput
%option header-file="lex.yy.h"

%%

10[1-9]+|1[1-9][0-9]+|[2-9][0-9][0-9]+ {yylval = atoi(yytext);return NUMALUNO;}

ISEP|ESE|ISCAP {yylval = strdup(yytext);}  return ESCOLA;

\"([A-Za-z]+[ ]?){1,40}\"  {yylval = strdup(yytext);}  return TIPONOME;

[1-9][0-9][0-9][0-9]+    {yylval = atoi(yytext);    return EXT;}

\n
. 

%%

