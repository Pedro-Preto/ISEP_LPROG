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

[a-z]{3}[0-9]{2} {yylval = strdup(yytext); return CODIGOFORMADOR;}

\"([A-Za-z]+[ ]?)+\" {yylval = strdup(yytext); return STRINGASPAS;}

[A-Z]{3}[0-9]{2} {yylval = strdup(yytext);} return CODIGOCURSO;

[1-9] {yylval = atoi(yytext); return ANOCURRICULAR;};

[1-9]|[1-9][0-9]+ {yylval = atoi(yytext); return NALUNOS;};

[1-9]|1[0-9] {yylval = atoi(yytext); return CARGAH;};


\n
. 

%%

