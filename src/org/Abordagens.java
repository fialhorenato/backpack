package org;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Abordagens {

	private static long start = System.currentTimeMillis();
	
	// SET THE BACKPACK SIZE

	private static int backpackSize = 100000;

	// CREATE THE BACKPACK

	private static List<Item> backpack;

	public static void main(String[] args) {

		// CREATE A NEW INSTANCE OF BACKPACK AND A RANDOM GENERATOR

		backpack = new ArrayList<Item>();
		Random r = new Random();

		for (int i = 0; i < backpackSize; i++) {
			backpack.add(new Item(r.nextInt(100), r.nextInt(100)));
		}

		// for (Item i : backpack) {
		// System.out.println(i.toString());
		// }

		profitApproach(backpack, 50);
		wheightApproach(backpack, 50);
		densityApproach(backpack, 50);
	}


	public static void profitApproach(List<Item> backpack, double maxWheight) {
		
		start = System.currentTimeMillis();
		List<Item> backpack2 = new ArrayList<Item>(backpack);
		double wheightSum = 0;
		double totalValue = 0;
		boolean choose = true;

		Item selectedItem;

		while (!backpack2.isEmpty() && wheightSum <= maxWheight
				&& choose == true) {

			choose = false;
			selectedItem = null;
			double valueNow = 0;

			for (Item i : backpack2) {
				if (valueNow < i.getValue()) {
					if ((i.getWheight() + wheightSum) <= maxWheight) {
						valueNow = i.getValue();
						selectedItem = i;
						choose = true;
					}
				}

			}

			if (choose == true) {
				if (selectedItem.getWheight() + wheightSum <= maxWheight) {
					wheightSum = wheightSum + selectedItem.getWheight();
					totalValue = totalValue + selectedItem.getValue();
					backpack2.remove(selectedItem);
				}

			}

		}
		long mili = System.currentTimeMillis() - start;  
		System.out.println("TIME SPENT == " + String.valueOf(Math.round(mili / 1000.0) + "SECONDS"));
		System.out.println("TOTAL VALUE IN VALUE APPROACH == " + totalValue);

	}

	public static void wheightApproach(List<Item> backpack, double maxWheight) {
		
		start = System.currentTimeMillis();
		List<Item> backpack2 = new ArrayList<Item>(backpack);
		double wheightSum = 0;
		double totalValue = 0;
		boolean choose = true;

		Item selectedItem;

		while (!backpack2.isEmpty() && wheightSum <= maxWheight
				&& choose == true) {

			choose = false;
			selectedItem = null;
			double wheightNow = 100;

			for (Item i : backpack2) {
				if (i.getWheight() < wheightNow) {
					if ((i.getWheight() + wheightSum) <= maxWheight) {
						wheightNow = i.getWheight();
						selectedItem = i;
						choose = true;
					}
				}

			}

			if (choose == true) {
				if (selectedItem.getWheight() + wheightSum <= maxWheight) {
					wheightSum = wheightSum + selectedItem.getWheight();
					totalValue = totalValue + selectedItem.getValue();
					backpack2.remove(selectedItem);
				}

			}

		}
		
		long mili = System.currentTimeMillis() - start;  
		System.out.println("TIME SPENT == " + String.valueOf(Math.round(mili / 1000.0) + "SECONDS"));
		System.out.println("TOTAL VALUE IN WHEIGHT APPROACH == " + totalValue);

	}

	public static void densityApproach(List<Item> backpack, double maxWheight) {

		start = System.currentTimeMillis();
		List<Item> backpack2 = new ArrayList<Item>(backpack);
		double wheightSum = 0;
		double totalValue = 0;
		boolean choose = true;

		Item selectedItem;

		while (!backpack2.isEmpty() && wheightSum <= maxWheight
				&& choose == true) {

			choose = false;
			selectedItem = null;
			double densityNow = 0;

			for (Item i : backpack2) {
				if ((i.getValue() / i.getWheight()) > densityNow) {
					if ((i.getWheight() + wheightSum) <= maxWheight) {
						densityNow = (i.getValue() / i.getWheight());
						selectedItem = i;
						choose = true;
					}
				}

			}

			if (choose == true) {
				if (selectedItem.getWheight() + wheightSum <= maxWheight) {
					wheightSum = wheightSum + selectedItem.getWheight();
					totalValue = totalValue + selectedItem.getValue();
					backpack2.remove(selectedItem);
				}

			}

		}
		
		long mili = System.currentTimeMillis() - start;  
		System.out.println("TIME SPENT == " + String.valueOf(Math.round(mili / 1000.0) + "SECONDS"));
		System.out.println("TOTAL VALUE IN DENSITY APPROACH == " + totalValue);

	}
}
