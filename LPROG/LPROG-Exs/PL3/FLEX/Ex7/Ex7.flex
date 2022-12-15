%option nounput  
%option noinput 

NUMBER (-[0-9]+,[0-9]+|[0-9]+,[0-9]+)
%%
{NUMBER}+ {printf("%s ",yytext);}
\n {printf("%s",yytext);}
-  {printf("%s",yytext);}
,  {printf("%s",yytext);}
.   

%%

int main()
{
            printf("\nStart...\n");
            yylex();
			
            printf("\nEnd...\n");   
     	    return 0;  
		
}
