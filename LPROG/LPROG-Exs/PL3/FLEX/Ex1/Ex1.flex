%{
        int numOccurencies=0;
%}

SEQUENCE xyz

%%

{SEQUENCE}+ {printf("Found: %s \n",yytext);numOccurencies++;}

\n

%%
int main(){
           printf("\nRunning...\n");
           yylex();
           printf("Number of Occurencies=%d\n",numOccurencies); 
           return 0;
}