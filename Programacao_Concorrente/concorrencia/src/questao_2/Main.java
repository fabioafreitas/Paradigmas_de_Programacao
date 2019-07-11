package questao_2;

public class Main {
	public static void main(String[] args) {
		CallCenter callCenter = new CallCenter();
		Cliente[] cliente = new Cliente[15];
		
		for (int i = 0; i < cliente.length; i++) {
			cliente[i] = new Cliente(""+(i+1)+"", callCenter);
			cliente[i].start();
		}
	}
}
