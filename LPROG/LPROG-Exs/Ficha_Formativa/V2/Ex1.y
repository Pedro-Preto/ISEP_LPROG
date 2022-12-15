%{
	#include <stdio.h>
	#include <string.h>
	#include "lex.yy.h" //incluir as decl. do flex
    void yyerror(const char *s); 			  
    void verificadorInformatica(char* departamento, char* nome,int ext);
	void printUni(char* uni);
	void increaseCount(char* escolas);
	void printEscolaComMaisAlunos(int vIsep,int vIscap,int vEse);
	int isepCount=0;
	int iscapCount=0;
	int eseCount=0;
	
%}

%token ESCOLA NUMALUNO TIPONOME EXT 
%start start
%define parse.error verbose //ajuda depuração erros

%%
start : | start complete ;//{printf("Funcionou \n");};

complete : pfrase  
         | sfrase  
         ;
		 
		 
pfrase:ESCOLA numValue TIPONOME{printUni($1);increaseCount($1);};

sfrase:TIPONOME numValue TIPONOME{verificadorInformatica($3,$1,$2);};	 
		 
numValue: EXT | NUMALUNO;


%% 

int main()
{   
	printf("\n\n\I N I C I O\n\n");
	yyparse();
	printf("====================================\n");
	printEscolaComMaisAlunos(isepCount,iscapCount,eseCount);
	printf("\n====================================");
	printf("\n\nF I M\n\n");	
	return 0;
}

	void printUni(char* uni){
	
	  printf("Universidade %s \n",uni);
	
	}


    void verificadorInformatica(char* departamento, char* nome,int ext){
	 int result;
	 char* eng="\"Eng informatica\"";
	 result=strcmp(departamento, eng);
	        if(result==0){
			printf("NOME: %s e Extensao:%d \n\n",nome,ext);
			
			}else{
			
			printf("Nao pertence ao departamento de Eng informatica\n\n");
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

