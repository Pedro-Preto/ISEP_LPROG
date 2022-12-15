%{
	#include <stdio.h>
	#include "lex.yy.h"
	void yyerror(const char *s); 
	verifica(int participantes);    
%}

%token CODIGO_REUNIAO DEPARTAMENTO DATA HORA_INICIO DURACAO SALA PARTICIPANTES
%start start
%define parse.error verbose

%destructor {free ($$);} SALA DATA PARTICIPANTES

%%
start : | start agenda {
				printf("\n");
				printf("%s\n", yytext);
			};

agenda :  opcional resto participantes
	;

opcional : CODIGO_REUNIAO DEPARTAMENTO
	| CODIGO_REUNIAO
	;
	
    
resto : DATA HORA_INICIO DURACAO SALA{
						printf("Sala: %s, Data: %s ", $4, $1);	
					};
	

participantes : PARTICIPANTES
	| PARTICIPANTES participantes {printf("Número de participantes: %d", verifica($1);}
	;
 
%%

int main()
{
	printf("Inicio\n");
	yyparse();
	printf("Fim\n");	
	return 0;
}

  

void yyerror(const char *s)
{  
  printf("erro sintatico/semantico: %s\n",s);
}

int verifica(int participantes)
{
	int nParticipantes=0;
		if(participantes!=0){
			nParticipantes++;
		}
	return nParticipantes;
}