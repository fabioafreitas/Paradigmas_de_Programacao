package questao_2;

import java.util.concurrent.Semaphore;

public class CallCenter {
	// pois temos apenas 5 operadores
	Semaphore semaforo = new Semaphore(5);
	
	public void atenderLigacao() {
		try {
			semaforo.acquire();
		} catch (InterruptedException ex) {
			ex.printStackTrace();
		}
	}
	
	public void encerrarLigacao() {
		semaforo.release();
	}
}
