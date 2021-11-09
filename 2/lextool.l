%{
int COMMENT=0;
%}
identifier [a-zA-Z][a-zA-Z0-9]*
%%
#.* {printf("\n%s is a preprocessor directive",yytext);}
int |
float |
char |
double |
while |
for |
struct |
typedef |
do |
if |
break |
continue |
void |
switch |
return |
else |
goto {printf("\n\t%s is a Keyword",yytext);}
"/*" {COMMENT=1;}{printf("\n\t %s is a Comment",yytext);}
{identifier}\( {if(!COMMENT)printf("\nFunction \n\t%s",yytext);}
\{  {if(!COMMENT)printf("\n Block Begins");}
\}  {if(!COMMENT)printf("Block Ends ");}
{identifier}(\[[0-9]*\])? {if(!COMMENT) printf("\n %s Identifier",yytext);}
\".*\" {if(!COMMENT)printf("\n\t %s is a String",yytext);}
[0-9]+ {if(!COMMENT) printf("\n %s is a Number ",yytext);}
\)(\:)? {if(!COMMENT)printf("\n\t");ECHO;printf("\n");}
\( ECHO;
= {if(!COMMENT)printf("\n\t %s is an Assignment Operator",yytext);}
\<= |
\>= |
\< |
== |
\> {if(!COMMENT) printf("\n\t%s is a Relational Operator",yytext);}
%%
int main(int argc, char **argv)
{
FILE *file;
file=fopen("var.c","r");
if(!file)
{
  printf("Could not open the file");
  exit(0);
}
yyin=file;
yylex();
printf("\n");
return(0);
}
int yywrap()
{
  return(1);
}
