
%{
#include <stdio.h>
#include <string.h>
#define tam_fila 10

typedef struct {
char dados[tam_fila];
int pos_escrita, pos_leitura, n;
} fila, *Fila;

void fila_init (Fila f){
	f->pos_escrita = 0;
	f->pos_leitura = 0;
	f->n = 0;
	}

void fila_adicionar (Fila f, char c){
	if(f->n < tam_fila){
	f->dados[f->pos_escrita] = c;
	f->pos_escrita = (f->pos_escrita + 1) % tam_fila;
	f->n += 1;
	}

}

char fila_remover(Fila f){
	char c;
	if (f->n>0){
	c = f->dados [f->pos_leitura];
	f->pos_leitura = (f->pos_escrita + 1) % tam_fila;
	f->n -= 1;
	return c;
	}	
	
}

%}

letras [a-zA-Z0-9]
palavra {letras}+
carac [._-]*
nome {palavra}{carac}{palavra}



%%



{nome}[@]{nome}[.com]* { printf("%s\n", yytext);}

[[:space:]]+ ;
[[:^space:]]+ ;


%%

int main() {
	
	/*fila f;
	fila_init (&f);
	while(f->n>0){ 
printf("%c", fila_remover(&f));  
	}
	printf("\n");*/
	yylex();
	return 0;
}
