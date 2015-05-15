package org;


public class Item {
	
	private double wheight;
	private double value;
	
	public Item(double peso, double valor) {
		this.wheight = peso;
		this.value = valor;
	}

	public double getWheight() {
		return wheight;
	}

	public void setWheight(double wheight) {
		this.wheight = wheight;
	}

	public double getValue() {
		return value;
	}

	public void setValue(double value) {
		this.value = value;
	}
	
	@Override
	public String toString() {
		return "=== ITEM === \n" + "WEIGHT == " +  this.wheight + "\n" + "VALUE == " + this.value; 
	}
	
}
