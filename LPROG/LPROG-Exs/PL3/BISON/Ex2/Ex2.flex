%{
  #include"Ex2.tab.h" // header gerado pelo BISON
%}

%option nounput
%option noinput
%option header-file="lex.yy.h"

%%
[0-9]+ { yylval=atoi(yytext); return NUMERO;}
\>       return MAIOR;
\<       return MENOR;
\>=      return IGUAL_MAIOR;
\<=      return IGUAL_MENOR;
\<\>     return DIFERENTE;
=        return IGUAL;

\n      

.  {;}
%%