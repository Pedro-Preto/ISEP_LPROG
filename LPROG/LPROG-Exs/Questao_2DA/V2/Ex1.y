%{
	#include <stdio.h>
	#include <string.h>
	#include "lex.yy.h" //incluir as decl. do flex
	void printCodigoNome(char* codigo,char* nome);
	void printValorAposDesconto(double total,double desconto);
	void verificador(double total,double desconto);
        void calcularTotal(double valor);	
	void yyerror(const char *s); 	
        double rTotal=0;			 
%}

%token CODIGO NOME PESO DATA DESCONTO SERVICO QUANTIDADE VALOR
%start start
%define parse.error verbose //ajuda depuração erros
%%
start : | start complete //{printf("Funcionou \n");};

complete: CODIGO NOME valorNumerico DATA valorNumerico servicoRep {printCodigoNome($1,$2);verificador(rTotal,$5);rTotal=0;}
        | CODIGO NOME DATA valorNumerico servicoRep  {printCodigoNome($1,$2);verificador(rTotal,$4);$5=0;rTotal=0;}
        ;
	  
servicoRep: SERVICO valorNumerico valorNumerico{calcularTotal($2*$3);}
          | valorNumerico valorNumerico{calcularTotal($1*$2);}
	  | servicoRep servicoRep
	  | servicoRep servicoRep servicoRep 
          ;
		  	  
valorNumerico: PESO | DESCONTO | QUANTIDADE | VALOR ;	  

%%

  void printCodigoNome(char* codigo,char* nome){
    
	printf("%s (%s)",nome,codigo);

  }
  void calcularTotal(double valor){
  rTotal+=valor;
  }
  
   void verificador(double total,double desconto){
        printf(" total de:%.2f \n",total);   
   if(desconto==0)
      printf("Sem desconto\n\n");
   else if(desconto < 0 || desconto > 100)
      printf("Fora do Limite 0-100\n\n");
   else{ 
      printValorAposDesconto(total,desconto);
    }
	}

  void printValorAposDesconto(double total,double desconto){
   
        double totaly=0;
	 
	    totaly=total*(1-desconto/100);
    
	    printf("Valor após desconto de %.2f % é:%.2f €\n\n",desconto,totaly);
 
    }


int main()
{
	printf("I N I C I O\n");
	yyparse();
	printf("\nF I M\n");	
	return 0;
}


void yyerror(const char *s)
{  
  printf("erro sintatico/semantico: %s\n",s);
}