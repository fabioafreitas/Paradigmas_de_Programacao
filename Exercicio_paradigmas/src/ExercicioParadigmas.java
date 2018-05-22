import java.util.Random;

public class ExercicioParadigmas {
	public static final int TAM = 100000000;
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
	
	public static void main(String[] args) {
		int[] vetorOrigem = new int[TAM];
		int[] vetorDestino = new int[TAM];
		long start, end;
		double total;
	
		preencherVetor(vetorOrigem);
		
		start = System.currentTimeMillis();
		passagem_valor(vetorOrigem, vetorDestino);
		end = System.currentTimeMillis();
		total = (double) (end - start)/1000;
		System.out.printf("\\npassagem por valor:      %.3f segundos\\n", total);
		
		start = System.currentTimeMillis();
		passagem_referencia(vetorOrigem, vetorDestino);
		end = System.currentTimeMillis();
		total = (double) (end - start)/1000;
		System.out.printf("passagem por referencia: %.3f segundos\\n", total);
	}
}
