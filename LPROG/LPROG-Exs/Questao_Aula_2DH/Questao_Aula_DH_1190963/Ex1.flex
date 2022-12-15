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
[A-Z][a-z]{1,31}    {yylval = strdup(yytext); return NOME;}

(202[0-9]|[2030])\/(0[1-9]|1[0-2])\/(0[1-9]|[1-2][0-9]|3[0-1]) {yylval = yytext[0]; return DATA;}

91[0-9]{7}|93[0-9]{7}|96[0-9]{7} {yylval = atoi(yytext); return TELEMOVEL;}

[a-z0-9]\@[a-z]\.[a-z]{2,3}   {yylval = strdup(yytext); return EMAIL;}

PESSOAL|TRABALHO|OUTRO {yylval = strdup(yytext); return TIPOCONTACTO;}

\"([A-Za-z]+[ ]?){1,64}\" {yylval = strdup(yytext); return NOTAS;}

\n
. 

%%

