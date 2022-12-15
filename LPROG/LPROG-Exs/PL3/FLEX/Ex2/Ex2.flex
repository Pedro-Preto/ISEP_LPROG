%option nounput  
%option noinput  

%%
 
FEUP {printf("ISEP");}
feup {printf("ISEP");}
2007 {printf("2008");}
.
\n

%%
int main()
{
            yylex() ;
            return 0;  
}
