%{
	#include <stdio.h>
	int valid=1;
%}

%token digit letter

%%
start : letter s
s : letter s
| digit s
|
;
%%

int yyerror() {
	printf("Its not a identifier!\n");
	valid=0;
	return 0;
}
int main() {
	printf("Enter a name to tested for identifier : ");
	yyparse();
	if(valid)	{
		printf("It is a identifier!\n");
	}
}
