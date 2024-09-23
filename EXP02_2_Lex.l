%{
	#include <stdio.h>
	#include <ctype.h>

	int lines = 0;
	int spaces = 0;
	int words = 0;
	int characters = 0;
	int in_word = 0;
%}

%%
\n { 
	lines++;
	characters++;
	in_word = 0;
}

[ \t] {
	spaces++;
	characters++;
	in_word = 0;
}

[a-zA-Z0-9_] {
	characters++;
	if (!in_word) {
		words++;
		in_word = 1;
	} 
}

. {
	characters++;
}
%%

int main(void) {
	yyin = fopen("myfile.txt", "r");
	if (!yyin) {
		perror("Error opening file");
		return 1;
	}
	yylex();
	fclose(yyin);
	printf("This file contains:");
	printf("\n\t%d lines", lines);
	printf("\n\t%d spaces", spaces);
	printf("\n\t%d words", words);
	printf("\n\t%d characters\n", characters);
	return 0;
}

int yywrap() {
	return 1;
}

/*
lex EXP02_2_Lex.l
gcc lex.yy.c
gcc lex.yy.c
*/

/*
This file contains:
	1 lines
	1 spaces
	2 words
	22 characters
*/
