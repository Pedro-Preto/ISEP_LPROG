%{
	#include <stdio.h>
	#include <string.h>
	#include "lex.yy.h" //incluir as decl. do flex
    void yyerror(const char *s); 			  
	void printEscola(char* escola);	
	void printDepartamento(char* departamento);
	void printFuncionariosDeInformatica(char* departamento,char* nome,int ext);
	void printFuncionariosDeInformatica(char* departamento,char* nome,int ext);
	void increaseCount(char* escolas);
	int isepCount=0;
	int eseCount=0;
	int iscapCount=0;
	
	
%}

%token ESCOLA NUMALUNO TIPONOME EXT 
%start start
%define parse.error verbose //ajuda depuração erros

%%
start : | start complete; //{printf("Funcionou \n");};

complete : pfrase   | sfrase  
         ;
		 
	  
pfrase: ESCOLA tipoNumero tipoString {printEscola($1);increaseCount($1);};
	  
sfrase: tipoString tipoNumero tipoString{printFuncionariosDeInformatica($3,$1,$2);}; 

tipoNumero: NUMALUNO| EXT;

tipoString: ESCOLA | TIPONOME;

 
%% 

int main()
{
	printf("I N I C I O\n");
	yyparse();
	printEscolaComMaisAlunos(isepCount,iscapCount,eseCount);
	printf("\nF I M\n");	
	return 0;
}

	void printEscola(char* escola){
	
	    printf("Escola %s \n",escola);
	
	}
	
	void printDepartamento(char* departamento){
	
	    printf("Departamento %s \n",departamento);
	
	}
	
	void printFuncionariosDeInformatica(char* departamento,char* nome,int ext){
	int result;
	char* eng="\"Eng informatica\"";
	result=strcmp(departamento, eng);
	        if(result==0){
			printf("NOME: %s e Extensao:%d \n",nome,ext);
			
			}else{
			
			printf("Nao pertence ao departamento de Eng informatica\n");
			}
	}

    void increaseCount(char* escolas){

    int resultIsep;
	int resultIscap;
	int resultEse;

	char* sIsep="ISEP";
	char* sIscap="ISCAP";
	char* sEse="ESE";

	resultIsep=strcmp(escolas, sIsep);
	resultIscap=strcmp(escolas, sIscap);
	resultEse=strcmp(escolas, sEse);

		if(resultIsep==0){
			isepCount++;
		}
		if(resultIscap==0){
			iscapCount++;
		}
		if(resultEse==0){
			eseCount++;
		}
	}

	void printEscolaComMaisAlunos(int vIsep,int vIscap,int vEse){

		if(vIscap > vEse && vIscap > vIsep){
			printf("A escola com mais alunos é o ISCAP");
		}else if(vEse > vIscap && vEse > vIsep){
				printf("A escola com mais alunos é a ESE");
		}else if(vIsep > vIscap && vIsep > vEse){
				printf("A escola com mais alunos é o ISEP");
		}
	}
 
 
	void yyerror(const char *s){  
		printf("erro sintatico/semantico: %s\n",s);
}

