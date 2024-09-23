%{
	#include<stdio.h>
	#include<ctype.h>
%}

%%
abc {
	printf("ABC");
}

. {
	putchar(yytext[0]);
}
%%

int main() {
	yylex();
	return 0;
}

int yywrap() {
	return(1);
}

/*
lex EXP02_3_Lex.l
gcc lex.yy.c
./a.out
*/

/*
abcabcxxxabc
ABCABCxxxABC
*/
