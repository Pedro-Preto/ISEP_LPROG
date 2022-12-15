%{
    #include <stdio.h>
	#include "lex.yy.h" //incluir as decl. do flex
              void yyerror(const char *s);
%}

%token HELLO WORLD
%start inicio
//%define parse.trace
%define parse.error verbose //ajuda depuração erros

%%
inicio :
         | inicio HELLO WORLD {puts("Encontrei HELLO WORLD!!!");};

%%

int main()
{
 printf("I N I C I O\n");
  
  //yydebug=1;
  yyparse();
  
  printf("F I M\n");
  return 0;
 
}

void yyerror(const char *s)
{  
  printf("erro sintatico/semantico: %s\n",s);
}
