%{
#include<stdio.h>
%}
%%
\/\/(.*) {};
\/\*(.*\n)*.*\*\/  {};
.	 {fprintf(yyout, "%s", yytext);}
%%

int yywrap(){
    return 1;
}

// driver code
int main()
{
	extern FILE *yyin, *yyout;
        yyin = fopen("input.txt", "r");
        yyout = fopen("output.txt", "w");
        yylex();
	return 0;
}