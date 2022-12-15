%{
  #include"exemplo.tab.h" /* header gerado pelo bison */
  extern int numErros;    /* variável criado no bison */
%}


%%

[0-9]+           yylval.inteiro=atoi(yytext);return INT;
[0-9]*\.[0-9]+   yylval.real=atof(yytext);return FLOAT;
,                return yytext[0];
[ \t]            /* ignorado */
.               {
                 printf("Erro lexico: simbolo desconhecido %s\n",yytext);
                 numErros++;
                }
\n        ;
<<EOF>>          return 0;

%%
