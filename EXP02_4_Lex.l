%{
	#include <stdio.h>
	int v = 0;
	int c = 0;
%}

%%
[aeiouAEIOU] {
	v++;
}

[a-zA-Z] {
	c++;
}
%%

int yywrap() {
	return 1;
}

int main() {
	printf("Enter the string of vowels and consonants:\n");
	yylex();
	printf("Number of vowels are: %d\n", v);
	printf("Number of consonants are: %d\n", c);
	return 0;
}

/*
lex EXP02_4_Lex.l
gcc lex.yy.c
./a.out
*/

/*
press Ctrl + d is output is not appearing
*/

/*
Enter the string of vowels and consonants:
acer

Number of vowels are: 2
Number of consonants are: 2

*/
