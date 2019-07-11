package questao_2;

import java.util.Random;

public class Cliente extends Thread{
	private String nome;
	private Random rand;
	CallCenter callCenter;
	
	public Cliente(String nome, CallCenter callCenter) {
		this.nome = nome;
		this.callCenter = callCenter; 
		rand = new Random();
	}
	
	@Override
	public void run() {
		while(true) {
			contatarCallCenter();
		}
	}
	
	public void contatarCallCenter() {
		callCenter.atenderLigacao();
		System.out.println("Atendendo o cliente ("+nome+")");
		try {
			Thread.sleep( (1+rand.nextInt(15)) + 1000 );
		} catch(InterruptedException ex) {
			ex.printStackTrace();
		}
		System.out.println("Encerrando o atendimento do cliente ("+nome+")");
		callCenter.encerrarLigacao();
	}
	
}
