package org;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Abordagens {

	private static int TAMANHOMOCHILA = 3;
	private static List<Item> Mochila;

	public static void main(String[] args) {
		Mochila = new ArrayList<Item>();
		Random r = new Random();

		for (int i = 0; i < TAMANHOMOCHILA; i++) {
			Mochila.add(new Item(i, r.nextInt(100), r.nextInt(100)));
		}

		for (Item i : Mochila) {
			System.out.println(i.toString());
		}

		AbordagemPorValor(Mochila, 100);
		// AbordagemPorPeso(Mochila, 50);
	}

	public static void AbordagemPorValor(List<Item> Mochila, double pesomax) {

		double pesoTotal = 0;
		double valorTotal = 0;
		double pesoAtual = 0;
		double valorAtual;

		while (!Mochila.isEmpty() && (pesoTotal + pesoAtual) <= pesomax)

		{
			Item ItemAtual = null;
			double ValorMax = 0;
			valorAtual = 0;
			pesoAtual = 0;

			for (Item i : Mochila) {
				if (i.getPeso() + pesoTotal <= pesomax) {
					if (ValorMax < i.getValor()) {
						ValorMax = i.getValor();
						pesoAtual = i.getPeso();
						valorAtual = i.getValor();
						ItemAtual = i;
					}
				}
			}
			
			Mochila.remove(ItemAtual);
			pesoTotal += pesoAtual;
			valorTotal += valorAtual;
			

		}

		System.out.println("VALOR TOTAL NA ABORDAGEM POR VALOR == "
				+ valorTotal);

	}

	public static void AbordagemPorPeso(List<Item> Mochila, int pesomax) {

		double pesoTotal = 0;
		double valorTotal = 0;

		double valorAtual;
		double pesoAtual;
		Item itemAtual = null;

		do {

			valorAtual = 0;
			pesoAtual = 100;

			for (Item i : Mochila) {

				if (i.getPeso() <= pesoAtual) {
					valorAtual = i.getValor();
					pesoAtual = i.getPeso();
					itemAtual = i;
				}

			}

			pesoTotal += pesoAtual;

			if (pesoTotal > pesomax) {
				Mochila.remove(itemAtual);
				valorTotal += valorAtual;
			}

		} while (pesoTotal <= pesomax && !Mochila.isEmpty());

		// System.out.println("\n === MOCHILA DEPOIS === \n");

		// for (Item i : Mochila) {
		// System.out.println(i.toString() + "\n");
		// }
		System.out.println(valorTotal);

	}

}
