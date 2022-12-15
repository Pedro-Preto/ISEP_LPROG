%{
	#include <stdio.h>
	#include <string.h>
	#include "lex.yy.h" //incluir as decl. do flex	
	void yyerror(const char *s); 	
 	void printNomeCodigoNalunos(char* nome,char* codigo, int num);	 
	void increaseTotal(int alunos);
	char* codigoF="";
	char* codaux="";
	int total=0;
	
%}
%token CODIGOFORMADOR STRINGASPAS CODIGOCURSO ANOCURRICULAR NALUNOS CARGAH 
%start start
%define parse.error verbose //ajuda depuração erros
%%
start : | start complete //{printf("Funcionou \n");};

complete: pfrase | sfrase  | error {yyerror;}
        ;


pfrase: CODIGOFORMADOR STRINGASPAS{codigoF=$1;}
	  | CODIGOFORMADOR{codigoF=$1;}
      ;

sfrase: CODIGOCURSO STRINGASPAS numpossivel numpossivel numpossivel{increaseTotal($4);printNomeCodigoNalunos(codigoF,$1,$4);}
      | CODIGOCURSO numpossivel numpossivel numpossivel{increaseTotal($3);printNomeCodigoNalunos(codigoF,$1,$3);}
      ;
	   
numpossivel: ANOCURRICULAR| NALUNOS| CARGAH;	  
	  

%%


int main()
{
	printf("\n\nI N I C I O\n\n");
	yyparse();
    printf("Total:%d\n",total);
	printf("\nF I M\n");	
	return 0;
}

void printNomeCodigoNalunos(char* nome,char* codigo, int num){

printf("%s %s %d alunos(s)\n",nome,codigo,num);

}
void increaseTotal(int alunos){
char* aux1="";

int resulta;
int resultb;

resulta=strcmp(aux1, codaux);
resultb =strcmp(codigoF, codaux);
   
   if(resulta==0){
	codaux=codigoF;
	total+=alunos;

	
	}else if(resultb==0){
	total+=alunos;
	
	}else if(resultb!=0){
	
	printf("Total:%d\n\n",total);
	codaux=codigoF;
	total=0;
	total+=alunos;
	}
}

void yyerror(const char *s)
{  
  printf("Erro: Registo Imcompleto\n");
}