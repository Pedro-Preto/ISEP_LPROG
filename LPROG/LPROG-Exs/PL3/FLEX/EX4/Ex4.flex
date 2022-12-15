%option nounput  
%option noinput 
%{
        int numAlgarismos=0;
		int numLetras=0;
		int numLinhas=1;
		int numTab=0;
		int numCaracteresNaoIdentificados=0;
%}


%%
[0-9] {numAlgarismos++;}
[a-z] {numLetras++;}
[ ] {numTab++;}
\n  {numLinhas++;}
.   {numCaracteresNaoIdentificados++;}

%%

int main()
{
            printf("\nStart...\n");
            yylex();
			printf("Number of Algarismos Occurencies=%d\n",numAlgarismos); 
			printf("Number of Letras Occurencies=%d\n",numLetras); 
			printf("Number of Tab Occurencies=%d\n",numTab); 
			printf("Number of Linhas Occurencies=%d\n",numLinhas); 
			printf("Number of CaracteresNaoIdentificados Occurencies=%d\n",numCaracteresNaoIdentificados); 

            printf("\nEnd...\n");   
     	    return 0;  
		
}
