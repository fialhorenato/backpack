package org;


public class Item {
	
	private int id;
	private double peso;
	private double valor;
	
	public Item(int id, double peso, double valor) {
		this.id = id;
		this.peso = peso;
		this.valor = valor;
	}

	public double getPeso() {
		return peso;
	}

	public void setPeso(double peso) {
		this.peso = peso;
	}

	public double getValor() {
		return valor;
	}

	public void setValor(double valor) {
		this.valor = valor;
	}
	
	public int getId() { 
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	@Override
	public String toString() {
		return "=== ITEM === \n" + "PESO == " +  this.peso + "\n" + "VALOR == " + this.valor; 
	}
	
}
