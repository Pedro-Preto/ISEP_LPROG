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
[A-Z][0-9]{3}[A-Z]{0,2}   {yylval = strdup(yytext);     return CODIGO;}

[A-Z][a-z]{1,}([ ][A-Z][a-z]{1,})? {yylval = strdup(yytext);	return NOME;}

[0-9]+(\.[0-9]{2})?           {yylval = atof(yytext);	return PESO;}

(20[0-4][0-9]|[2050])\.(0[1-9]|1[0-2])\.(0[1-9]|[1-2][0-9]|3[0-1]) {yylval = yytext[0]; return DATA;}

([0-9]{1,2}\.[0-9]{2}|[100.00])         {yylval = atof (yytext); return DESCONTO;}

CONSULTA|CIRURGIA|COSMETICA|ALIMENTACAO|ESTADIA		{yylval = strdup(yytext); return SERVICO;}

[0-9]+ {yylval = atoi(yytext); return QUANTIDADE;}

-?[0-9]+\.[0-9]{2} {yylval = atof(yytext);return VALOR;}

\n
. 

%%

