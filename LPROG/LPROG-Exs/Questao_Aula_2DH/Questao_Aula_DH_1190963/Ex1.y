%{
	#include <stdio.h>
	#include <string.h>
	#include "lex.yy.h" //incluir as decl. do flex	
	void yyerror(const char *s); 	
	void printNome(char* nome);
	void printEmailAndContacto(char* email,int telemovel);
	void printTipoDeContacto(char* tipoDeContacto);
	void increaseContactos(char* tipoDeContacto);
	void printTotalContactos(int contactos);
	void printContactosPessoais(int totalContactosPessoais);
	void printContactosTrabalho(int totalContactosTrabalho);
	int totalContactos=0;
    int contactosPessoais=0;
    int contactosTrabalho=0;
	
%}
%token NOME DATA TELEMOVEL EMAIL TIPOCONTACTO NOTAS 
%start start
%define parse.error verbose //ajuda depuração erros
%%
start : | start complete;

complete: pfrase | error {yyerror;}
        ;

pfrase: NOME DATA TELEMOVEL EMAIL TIPOCONTACTO repnotas {printNome($1);printEmailAndContacto($4,$3);printTipoDeContacto($5);increaseContactos($5);}
	  | NOME TELEMOVEL EMAIL TIPOCONTACTO repnotas {printNome($1);printEmailAndContacto($3,$2);printTipoDeContacto($4);increaseContactos($4);}
      ;

repnotas: NOTAS
        | repnotas repnotas;
	  

%%


int main()
{
	printf("\n\nI N I C I O\n\n");
	yyparse();
	printContactosPessoais(contactosPessoais);
    printContactosTrabalho(contactosTrabalho);
	printTotalContactos(totalContactos);
	printf("\nF I M\n");	
	return 0;
}

	void printNome(char* nome){
	printf("%s \n",nome);
	}
	
	void printEmailAndContacto(char* email,int telemovel){
	printf("%d , %s \n",telemovel,email);
	}
	void printTipoDeContacto(char* tipoDeContacto){
		printf("%s \n\n",tipoDeContacto);
	}
	
	void increaseContactos(char* tipoDeContacto){
	char* pessoal="PESSOAL";
	char* trabalho="TRABALHO";
	char* outro="OUTRO";
	int resulta;
    int resultb;
	int resultc;
	resulta=strcmp(tipoDeContacto, pessoal);
    resultb =strcmp(tipoDeContacto, trabalho);
    resultc=strcmp(tipoDeContacto, outro);
	
	if(resulta==0){
	 contactosPessoais++;
     totalContactos++;
	
	}else if(resultb==0){
     contactosTrabalho++;
	 totalContactos++;
	
	}else if(resultc==0){
	 totalContactos++;

	}
	
	}
	
	void printTotalContactos(int contactos){
	
       printf("Total contactos:%d \n",contactos);
	}
    
	void printContactosPessoais(int totalContactosPessoais){
       printf("Total contactos:%d \n",totalContactosPessoais);

   }
	
   void printContactosTrabalho(int totalContactosTrabalho){
	       printf("Total contactos:%d \n",totalContactosTrabalho);

	}


void yyerror(const char *s)
{  
   printf("erro sintatico/semantico: %s\n",s);
 // printf("Erro de registo\n");
}