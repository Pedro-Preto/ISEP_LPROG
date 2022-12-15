%{
	#include <stdio.h>
	#include <string.h>
	#include "lex.yy.h" //incluir as decl. do flex
	
	          void yyerror(const char *s); 			  
		      void verificador(double desconto,double total);			
			  void printTotal(double total);
	          void printNomeAndCodigo(char *nome,char *codigo);
	          void printValorDepoisDoDesconto(double total,double desconto);
%}

%token CODIGO NOME PESO DATA DESCONTO SERVICO QUANTIDADE VALOR
%start start
%define parse.error verbose //ajuda depuração erros
%%
start : | start complete //{printf("Funcionou \n");};

complete :  frase servico {verificador($1,$2);}
	      | frase servico servico {verificador($1,$2+$3);}
		  | frase servico servico servico {verificador($1,$2+$3+$4);}
		  ;

servico : SERVICO numero numero {$$=($2*$3);}
	    | numero numero {$$=($1*$2);}
	;
    
frase : CODIGO NOME numero DATA numero {$$=$5;printNomeAndCodigo($2,$1);}
	  |CODIGO NOME DATA numero {$$=$4;printNomeAndCodigo($2,$1);}
	  ;

numero : PESO | DESCONTO | QUANTIDADE | VALOR;
 
 

%%

int main()
{
	printf("I N I C I O\n");
	yyparse();
	printf("\nF I M\n");	
	return 0;
}

  void verificador(double desconto,double total){
    printTotal(total);
  if(desconto==0)
    printf("\nSem desconto\n");
  else if(desconto < 0 || desconto > 100)
    printf("\nFora do Limite 0-100\n");
  else{ 
  printValorDepoisDoDesconto(desconto,total);
}
  }
	
    void printTotal(double total){
	printf("Total de:%.2f €\n",total);
	}

  	void printValorDepoisDoDesconto(double desconto,double total){
	   double totaly=0;
	   totaly=total*(1-desconto/100);
       printf("\nValor após desconto de %.2f % é:%.2f €\n",desconto,totaly);
	}

	
	void printNomeAndCodigo(char* nome,char* codigo){
	printf("\n%s(%s)",nome,codigo);
	
	}

void yyerror(const char *s)
{  
  printf("erro sintatico/semantico: %s\n",s);
}