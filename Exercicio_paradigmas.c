#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define TAM 100000000

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

    int* vetorOrigem = (int*) malloc(sizeof(int)*TAM);
    int* vetorDestino = (int*) malloc(sizeof(int)*TAM);
    clock_t start, end;
    double total_t = 0;

    preencherVetor(vetorOrigem, TAM);

    start = clock();
    passagem_valor(vetorOrigem, vetorDestino, TAM);
    end = clock();
    total_t = ((double) (end - start)) / CLOCKS_PER_SEC;
    printf("\npassagem por valor:      %.3f segundos\n", total_t);

    start = clock();
    passagem_referencia(vetorOrigem, vetorDestino, TAM);
    end = clock();
    total_t = ((double) (end - start)) / CLOCKS_PER_SEC;
    printf("passagem por referencia: %.3f segundos\n", total_t);
}
