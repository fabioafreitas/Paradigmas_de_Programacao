import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

public class ExercicioParadigmas {
	public static final int QtdIteracoes = 25;
	public static final int TAM = 30000000; // 30 million
	public static Random rand = new Random();
	
	public static void preencherVetor(int[] v) {
		for(int i = 0; i<v.length ; i++) {
			v[i] = rand.nextInt(TAM);
		}
	}
	
	public static int valor_formal(int valorFormal) {
		return valorFormal;
	}
	
	public static void passagem_valor(int[] vetorOrigem, int[] vetorDestino) {
		for(int i = 0 ; i<vetorOrigem.length ; i++) {
			vetorDestino[i] = valor_formal(vetorOrigem[i]);
		}
	}
	
	public static void passagem_referencia(int[] vetorOrigem, int[] vetorDestino) {
		for(int i = 0 ; i<vetorOrigem.length ; i++) {
			vetorDestino[i] = vetorOrigem[i];
		}
	}
	
	public static boolean equals(int[] v1, int[] v2) {
		for(int i=0; i< v1.length ; i++ ) {
			if(v1[i] != v2[i]) {
				return false;
			}
		}
		return true;
			
	}
	
	public static void main(String[] args) throws IOException{
		int[] vetorOrigem = new int[TAM];
		int[] vetorDestino = new int[TAM];
		long start, end;
		double total;
		
		int i=1;
		//preencherVetor(vetorOrigem);
		
		FileWriter arq1 = new FileWriter("D:\\Pepê\\2018.1 UFRPE\\Paradigmas de Programação\\Exercicio_2\\referencia2.out");
	    PrintWriter gravarArq1 = new PrintWriter(arq1);
	    FileWriter arq2 = new FileWriter("D:\\Pepê\\2018.1 UFRPE\\Paradigmas de Programação\\Exercicio_2\\valor2.out");
	    PrintWriter gravarArq2 = new PrintWriter(arq2);
	    	
		while(i <= QtdIteracoes) {
			System.out.printf("------------------ %d ----------------------", i);
			preencherVetor(vetorOrigem);
			start = System.currentTimeMillis();
			passagem_valor(vetorOrigem, vetorDestino);
			end = System.currentTimeMillis();
			total = (double) (end - start)/1000;
			System.out.printf("\npassagem por valor:      %.3f segundos\n", total);
			
			gravarArq1.printf("%.3f\n",total);
			
			start = System.currentTimeMillis();
			passagem_referencia(vetorOrigem, vetorDestino);
			end = System.currentTimeMillis();
			total = (double) (end - start)/1000;
			System.out.printf("passagem por referencia: %.3f segundos\n", total);
			
			gravarArq2.printf("%.3f\n",total);
			 i++;
		}
				
	    arq1.close();
	    arq2.close();
	}
}

