%{
    #include <stdio.h>
	#include "lex.yy.h" //incluir as decl. do flex
              void yyerror(const char *s);
%}

%token NUMERO MAIOR MENOR IGUAL DIFERENTE IGUAL_MAIOR IGUAL_MENOR

%start inicio
//%define parse.trace
%define parse.error verbose //ajuda depuração erros

%%
inicio :
         |  inicio LINHA  {if($2==-1)
		                   printf("Erro sintaxe \n");
						   else
						   printf("Expressao %s\n",$2?"Verdadeira":"Falso");}
	    ;


OPERADOR:MAIOR | MENOR | IGUAL | DIFERENTE | IGUAL_MAIOR | IGUAL_MENOR;


LINHA: NUMERO MAIOR NUMERO  {$$=$1>$3;}	  
	  | NUMERO MENOR NUMERO  {$$=$1<$3;}
	  | NUMERO IGUAL_MAIOR NUMERO  {$$=$1>=$3;}
	  | NUMERO IGUAL_MENOR NUMERO  {$$=$1<=$3;}
	  | NUMERO DIFERENTE NUMERO  {$$=$1!=$3;}
	  | NUMERO IGUAL NUMERO  {$$=$1==$3;}
	  |LINHA_ERRADA  {$$=-1;}
	  ;

 LINHA_ERRADA:OPERADOR NUMERO;
 
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
