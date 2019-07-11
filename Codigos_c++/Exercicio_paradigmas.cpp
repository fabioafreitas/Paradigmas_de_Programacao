 #include <iostream>
 #include <ctime>
 #include <cstdlib>
 #include <fstream>
 
 #define TAM 100000000 // 10 million
 #define qtdIteracoes 5
 
void preencherVetor(int* v, int lenght) {
	for(int i = 0; i<lenght ; i++) {
 		v[i] = rand()%lenght;	
	}
}
 
int valor_formal(int valor) {
	return valor;
}
 
void passagem_valor(int* vetorOrigem, int* vetorDestino, int lenght) {
	for(int i = 0; i<lenght ; i++) {
 		vetorDestino[i] = valor_formal(vetorOrigem[i]);
	}
}

void passagem_referencia(int* vetorOrigem, int* vetorDestino, int lenght) {
 	for(int i = 0; i<lenght ; i++) {
 		vetorDestino[i] = vetorOrigem[i];
	}
}
 
using namespace std;
int main() {
	srand((unsigned)time(0));
	clock_t start, end;
	int i = 1, j;
	
	int* vetorOrigem = (int*) malloc(sizeof(int)*TAM);
	int* vetorDestino = (int*) malloc(sizeof(int)*TAM);
	double total_t;
	
	ofstream arq1, arq2;
	arq1.open("valor2.out");
	arq2.open("referencia2.out");
	
	while(i <= qtdIteracoes) {
		cout<<"----------------- "<<i<<" ------------------------"<<endl;
		preencherVetor(vetorOrigem, TAM);
		
		start = clock();
		passagem_valor(vetorOrigem, vetorDestino, TAM);
		end = clock();
		total_t = ((double) (end-start))/CLOCKS_PER_SEC;
		cout<<"\npassagem por valor:      "<<total_t<<" segundos\n"<<endl;
		j = total_t*1000;
		
		arq1 <<"0,"<<j<<endl;
		
		start = clock();
		passagem_referencia(vetorOrigem, vetorDestino, TAM);
		end = clock();
		total_t = ((double) (end-start))/CLOCKS_PER_SEC;
		cout<<"passagem por referencia: "<<total_t<<" segundos\n"<<endl;
		j = total_t*1000;
		
		arq2 <<"0,"<<j<<endl;
		i++;
	}
	
	arq1.close();
	arq2.close();
	return 0;	
}
