
%{
#include <stdio.h>
#include <string.h>


%}

letras [a-zA-Z0-9]
palavra {letras}+
palavra2 {letras}*
carac [._-]*
meio ({carac}{palavra})*
nome {palavra}{meio}
caracponto[.]
email {nome}[@]{nome}
nomegeral [@,!]*{nome}
caracespeciais [!@,]*


%%
{caracponto} {};
{email} { printf("%s\n", yytext);} ;


[[:space:]]+ ;
{nomegeral} ;
{caracespeciais} ;

%%

int main() {
	
		yylex();
	return 0;
}
