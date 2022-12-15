%{
  #include"Ex1.tab.h" // header gerado pelo BISON
%}

%option nounput
%option noinput
%option header-file="lex.yy.h"

%%
[hH][eE][lL][lL][oO] return HELLO;   	
[wW][oO][rR][lL][dD] return WORLD;
\n
.  {;}
%%