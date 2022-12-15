MATRICULA1    ([A-Z][A-Z]-[0-9][0-9]-[0-9][0-9])
MATRICULA2    ([0-9][0-9]-[0-9][0-9]-[A-Z][A-Z])
MATRICULA3    ([0-9][0-9]-[A-Z][A-Z]-[0-9][0-9])
MATRICULA4    ([A-Z][A-Z]-[A-Z][A-Z]-[0-9][0-9])
MATRICULA5    ([0-9][0-9]-[A-Z][A-Z]-[A-Z][A-Z])
MATRICULA6    ([A-Z][A-Z]-[0-9][0-9]-[A-Z][A-Z])

%%

{MATRICULA1}    {
            printf("\nMatrícula %s É VÁLIDA\n", yytext);
        }
{MATRICULA2}    {
            printf("\nMatrícula %s É VÁLIDA\n", yytext);
        }
{MATRICULA3}    {
            printf("\nMatrícula %s É VÁLIDA\n", yytext);
        }
{MATRICULA4}    {
            printf("\nMatrícula %s É VÁLIDA\n", yytext);
        }
{MATRICULA5}    {
            printf("\nMatrícula %s É VÁLIDA\n", yytext);
        }
{MATRICULA6}    {
            printf("\nMatrícula %s É VÁLIDA\n", yytext);
        }

.*        {    
            printf("Matrícula %s É INVÁLIDA\n", yytext);        
        }
\n

%%

main()
{
    yylex();
    return 0;
}