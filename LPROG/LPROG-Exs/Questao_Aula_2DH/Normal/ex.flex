%{
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
  #include "ex.tab.h"

%}

%option nounput
%option noinput
%option header-file="lex.yy.h"

%%

[A-Z][0-9]{3}       return CODIGO_REUNIAO;

[A-Z][a-z]*  	return DEPARTAMENTO;

(0[1-9])|([1-2][0-9])|(3[0-1])-(0[1-9])|(1[0-2])-20[0-9][0-9]		 yylval.str=strdup(yytext); return DATA;

((0[89])|(1[0-8]))(([0-2][0-9])|30)		return HORA_INICIO;

([3-9][0-9])|(1[0-7][0-9])|180		{yylval = atoi (yytext); return DURACAO;}

S[0-9][0-9]		 yylval.str=strdup(yytext); return SALA;

[A-Z][a-z]*\,[A-Z][a-z]*		return PARTICIPANTES;

\n
. 

%%

