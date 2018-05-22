#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define QtdIteracoes 25
#define TAM 30000000 // 30 million

void preencherVetor(int* v, int lenght) {
    int i;
    for(i=0;i<lenght;i++) {
        v[i] = rand()%lenght;
    }
}

// recebe uma cópia do valor dado no parametro e o retorna
int valor_formal(int valor) {
    return valor;
}

// a passagem ocorre por valor, logo os valores passados são os formais
void passagem_valor(int* vetorOrigem, int* vetorDestino, int lenght) {
    int i;
    for(i=0;i<lenght;i++) {
        vetorDestino[i] = valor_formal(vetorOrigem[i]);
    }
}

// a passagem ocorre por referencia, logo os valores passados são os reais
void passagem_referencia(int* vetorOrigem, int* vetorDestino, int lenght) {
    int i;
    for(i=0;i<lenght;i++) {
        vetorDestino[i] = vetorOrigem[i];
    }
}

int main() {
    srand(time(NULL));
	int i=1, j;
	
    int* vetorOrigem = (int*) malloc(sizeof(int)*TAM);
    int* vetorDestino = (int*) malloc(sizeof(int)*TAM);
    clock_t start, end;
    double total_t = 0;
	
	
	FILE* arq1 = fopen("valor.out","w");
	FILE* arq2 = fopen("referencia.out","w");
	
    while(i <= QtdIteracoes) {
    	printf("----------------- %i ------------------------", i);
    	preencherVetor(vetorOrigem, TAM);
    	// passagem por valor
    	start = clock();
	    passagem_valor(vetorOrigem, vetorDestino, TAM);
	    end = clock();
	    total_t = ((double) (end - start)) / CLOCKS_PER_SEC;
	    printf("\npassagem por valor:      %.3f segundos\n", total_t);
		
		j = total_t*1000;
		fprintf(arq1, "0,%i\n", j);
		
		// passagem por referência
	    start = clock();
	    passagem_referencia(vetorOrigem, vetorDestino, TAM);
	    end = clock();
	    total_t = ((double) (end - start)) / CLOCKS_PER_SEC;
	    printf("passagem por referencia: %.3f segundos\n", total_t);
	    
	    j = total_t*1000;
	    fprintf(arq2, "0,%i\n", j);
	    i++;
	}

	fclose(arq1);
	fclose(arq2);
}
