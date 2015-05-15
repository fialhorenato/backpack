#!/usr/bin/ruby

class Item
  def initialize(nome, peso, valor)
    @nome = nome
    @peso = peso
    @valor = valor

    @densidade = @valor.to_f / @peso.to_f
  end

  def peso
    @peso
  end

  def nome
    @nome
  end

  def valor
    @valor
  end

  def densidade
    @densidade
  end

  def to_s
    "#{@nome} -- Valor: #{@valor} | Peso: #{@peso} | Densidade: #{@densidade}"
  end
end

def soma_peso(backpack)
  backpack.map(&:peso).inject(0, &:+) || 0
end

def soma_valor(backpack)
  backpack.map(&:valor).inject(0, &:+) || 0
end

def escolha_por_valor(dispensa, limite)
  backpack = []
  maior_valor = 0
  pick = false

  loop do
    escolhido = nil

    # Verifica cada item da dispensa guardando os de maior valor
    dispensa.each do |item|
      if item.valor > maior_valor

        maior_valor = item.valor

        escolhido = item

        pick = true
      end
    end

    # Soma o peso da mochila
    peso_mochila = soma_peso(backpack)

    # Sai caso tenha ultrapassado o peso ou nao tenha selecionado nenhum
    break if peso_mochila + escolhido.peso > limite || !pick

    # Remove o item escolhido da dispensa
    dispensa.delete_if { |i| i == escolhido }

    backpack << escolhido

    pick = false
    maior_valor = 0
  end

  backpack
end

def escolha_por_peso(dispensa, limite)
  backpack = []
  menor_peso = 99999
  pick = false

  loop do
    escolhido = nil

    dispensa.each do |item|
      if item.peso < menor_peso
        menor_peso = item.peso
        escolhido = item
        pick = true
      end
    end

    # Pesamos a mochila
    peso_mochila = soma_peso(backpack)

    # Sai caso tenha ultrapassado o peso ou nao tenha selecionado nenhum
    break if peso_mochila + menor_peso > limite || !pick

    # Remove o item escolhido da dispensa
    dispensa.delete_if { |i| i == escolhido }

    # Adiciona o item na mochila
    backpack << escolhido

    pick = false
    menor_peso = 9999
  end

  backpack
end

def escolha_por_densidade(dispensa, limite)
  backpack = []
  maior_densidade = -1
  pick = false

  loop do
    escolhido = nil

    # Verifica cada item da dispensa guardando os de maior valor
    dispensa.each do |item|

      if item.densidade > maior_densidade

        maior_densidade = item.densidade

        escolhido = item

        pick = true
      end
    end

    break if !pick

    # Soma o peso da mochila
    peso_mochila = soma_peso(backpack)

    # Sai caso tenha ultrapassado o peso ou nao tenha selecionado nenhum
    break if peso_mochila + escolhido.peso > limite

    # Remove o item escolhido da dispensa
    dispensa.delete_if { |i| i == escolhido }

    backpack << escolhido

    pick = false
    maior_densidade = -1
  end

  backpack
end



#### Iniciando a execucao das funcoes ######


nomes = ['banana','abacaxi','camera','computador','iphone']
valores = [15,20,5,25,10]
pesos = [20,50,40,10,30]

limite_peso = 60

dispensa = d1 = d3 = d3 = []

(0..4).each do |i|
  dispensa << Item.new(
      nomes[i],
      pesos[i],
      valores[i]
    )
end

d1 = dispensa.inject([]) { |a,element| a << element.dup }
d2 = dispensa.inject([]) { |a,element| a << element.dup }
d3 = dispensa.inject([]) { |a,element| a << element.dup }


puts "Itens na dispensa"
puts "\n"

puts "\nPeso total da dispensa: #{soma_peso(dispensa)}"
puts "Valor total da dispensa: #{soma_valor(dispensa)}"
puts "Limite de peso #{limite_peso}"

puts "\n----------------------------------------"
puts "Escolher itens por peso."
backpack = escolha_por_peso(d1, limite_peso)
puts "\nItens escolhidos"
puts "##########"
puts backpack
puts "########"
puts "\nPeso da mochila: #{soma_peso(backpack)}"
puts "Valor total dos produtos: #{soma_valor(backpack)}"
puts "----------------------------------------"

puts "\nEscolher itens por lucro."
backpack = escolha_por_valor(d2, limite_peso)
puts "\nItens escolhidos"
puts "##########"
puts backpack
puts "##########"
puts "\nPeso da mochila: #{soma_peso(backpack)}"
puts "Valor total dos produtos: #{soma_valor(backpack)}"
puts "----------------------------------------"

puts "\nEscolher itens por densidade."
backpack = escolha_por_densidade(d3, limite_peso)
puts "\nItens escolhidos"
puts "##########"
puts backpack
puts "##########"
puts "\nPeso da mochila: #{soma_peso(backpack)}"
puts "Valor total dos produtos: #{soma_valor(backpack)}"
