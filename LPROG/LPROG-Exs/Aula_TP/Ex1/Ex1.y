%{
    #include <stdio.h>
        #include "lex.yy.h" //incluir as decl. do flex
		      void yyerror(const char *s);
%}

%error-verbose	//ajuda depuração erros
%token INT
%start regra

%%

regra: regra expressao '\n' {printf("Resultado: %d\n",$2);} 
	| /*vazio*/
	| error '\n'
	;

expressao:  operando '+' operando    {$$=$1+$3;}
	   | operando '-' operando    {$$=$1-$3;}
	   | operando '*' operando    {$$=$1*$3;}
	   | operando '/' operando    {if($3!=0) $$=$1/$3; 
									else {printf("«divisão por ZERO!»"); $$=0;}
								  }
	  | operando operando {yyerror("falta operador");}
	  | '+' operando {yyerror("falta operando ESQ");}
	   ;

operando: INT {$$=$1;}
          ;

%%

int main(){
  printf("Terminar com Ctrl+D:\n");
  yyparse();
  printf("F I M\n");
}

void yyerror(const char *s)
{  
  printf("erro sintatico/semantico: %s\n",s);
}
