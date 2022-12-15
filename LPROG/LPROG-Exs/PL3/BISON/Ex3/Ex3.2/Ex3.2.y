%{
    #include <stdio.h>
	#include "lex.yy.h" //incluir as decl. do flex
              void yyerror(const char *s);
			  void verifica(int cifrao1 ,int operador, int cifrao3);
%}

%token NUMERO MAIOR MENOR IGUAL DIFERENTE IGUAL_MAIOR IGUAL_MENOR LETRA

%start inicio
//%define parse.trace
%define parse.error verbose //ajuda depuração erros

%%
inicio :
         |  inicio LINHA  ;
		 

OPERADOR:MAIOR | MENOR | IGUAL | DIFERENTE | IGUAL_MAIOR | IGUAL_MENOR;


LINHA:EXPRE_NUMERICA | EXPRE_ALFA ;

	  
EXPRE_NUMERICA: NUMERO MAIOR NUMERO  {verifica($1,MAIOR,$3);$$=$3;}	  
	            | NUMERO MENOR NUMERO  {verifica($1,MENOR,$3);$$=$3;}
				| NUMERO IGUAL_MAIOR NUMERO  {verifica($1,IGUAL_MAIOR,$3);$$=$3;}
				| NUMERO IGUAL_MENOR NUMERO  {verifica($1,IGUAL_MENOR,$3);$$=$3;}
				| NUMERO IGUAL NUMERO  {verifica($1,IGUAL,$3);$$=$3;}   
				| NUMERO DIFERENTE NUMERO  {verifica($1,DIFERENTE,$3);$$=$3;}
				| EXPRE_NUMERICA MAIOR NUMERO  {verifica($1,MAIOR,$3);$$=$3;}	  
				| EXPRE_NUMERICA MENOR NUMERO  {verifica($1,MENOR,$3);$$=$3;}
				| EXPRE_NUMERICA IGUAL_MAIOR NUMERO  {verifica($1,IGUAL_MAIOR,$3);$$=$3;}
				| EXPRE_NUMERICA IGUAL_MENOR NUMERO  {verifica($1,IGUAL_MENOR,$3);$$=$3;}
				| EXPRE_NUMERICA IGUAL NUMERO  {verifica($1,IGUAL,$3);$$=$3;}   
				| EXPRE_NUMERICA DIFERENTE NUMERO  {verifica($1,DIFERENTE,$3);$$=$3;}
				| LETRA OPERADOR NUMERO  {puts("Incompativel");$$=$3;}
				| EXPRE_ALFA OPERADOR NUMERO  {puts("Incompativel");$$=$3;}
;
		
EXPRE_ALFA: LETRA MAIOR LETRA  {verifica($1,MAIOR,$3);$$=$3;}
	      | LETRA MENOR LETRA  {verifica($1,MENOR,$3);$$=$3;}
	      | LETRA IGUAL_MAIOR LETRA  {verifica($1,IGUAL_MAIOR,$3);$$=$3;}
	      | LETRA IGUAL_MENOR LETRA  {verifica($1,IGUAL_MENOR,$3);$$=$3;}
	      | LETRA IGUAL LETRA  {verifica($1,IGUAL,$3);$$=$3;}
	      | LETRA DIFERENTE LETRA  {verifica($1,DIFERENTE,$3);$$=$3;}
	      | EXPRE_ALFA MAIOR LETRA  {verifica($1,MAIOR,$3);$$=$3;}
	      | EXPRE_ALFA MENOR LETRA  {verifica($1,MENOR,$3);$$=$3;}
	      | EXPRE_ALFA IGUAL_MAIOR LETRA  {verifica($1,IGUAL_MAIOR,$3);$$=$3;}
	      | EXPRE_ALFA IGUAL_MENOR LETRA  {verifica($1,IGUAL_MENOR,$3);$$=$3;}
	      | EXPRE_ALFA IGUAL LETRA  {verifica($1,IGUAL,$3);$$=$3;}
	      | EXPRE_ALFA DIFERENTE LETRA  {verifica($1,DIFERENTE,$3);$$=$3;}
		  | NUMERO OPERADOR LETRA  {puts("Incompativel");$$=$3;}
	      | EXPRE_NUMERICA OPERADOR LETRA  {puts("Incompativel");$$=$3;}
		  ;



%%

int main()
{
 printf("I N I C I O\n");
  
  //yydebug=1;
   yyparse();
    return 0;
}
  void verifica(int cifrao1, int operador, int cifrao3){
  int vlogico=0;
switch(operador)
       {
	   case MAIOR:vlogico=(cifrao1>cifrao3);break;
	   case MENOR:vlogico=(cifrao1<cifrao3);break;
	   case IGUAL_MAIOR:vlogico=(cifrao1>=cifrao3);break;
	   case IGUAL_MENOR:vlogico=(cifrao1<=cifrao3);break;
	   case DIFERENTE:vlogico=(cifrao1!=cifrao3);break;
	   case IGUAL:vlogico=(cifrao1==cifrao3);break;
	   };
	   printf("Expressão %s\n",vlogico?"Verdadeira":"Falsa");

}
  

void yyerror(const char *s)
{  
  printf("erro sintatico/semantico: %s\n",s);
}
