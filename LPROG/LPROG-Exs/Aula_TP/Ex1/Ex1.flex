%{
  #include"Ex1.tab.h" // header gerado pelo BISON
%}

%%

[0-9]+    	{yylval=atoi(yytext); return INT;}
[-+*/\n]	return yytext[0];
[ \t\r]    	/* ignorado */  // \r=CR & \n=LF

.          	printf("Erro lexico: simbolo desconhecido %s\n",yytext); 

<<EOF>>    	return 0;

