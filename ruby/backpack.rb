#!/usr/bin/ruby

class Item
  def initialize(nome, peso, valor)
    @nome = nome
    @peso = peso
    @valor = valor
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

  def to_s
    "#{@nome} -- Valor: #{@valor} | Peso: #{@peso}"
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


nomes = ['banana','abacaxi','camera','computador','iphone','macbook','atum','suco de maca','acai','barrinha','bota']

dispensa = []

limite_valor = 100
limite_peso = 100
limite_densidade = 100

(0..nomes.length - 1).each do |i|
  # Seleciona aleatoriamente 1 nome
  nome = nomes.sample

  # Remove do array para nao duplicar itens
  nomes.delete(nome)

  dispensa << Item.new(
      nome,
      (5..50).to_a.sample,
      (5..50).to_a.sample
    )
end


puts "Itens na dispensa"
puts "\n"
# Mostra como esta a dispensa
dispensa.map{ |item| puts item.to_s }

puts "\nPeso total da dispensa: #{soma_peso(dispensa)}"
puts "\n----------------------------------------"

puts "\nEscolher itens por peso. Limite de peso #{limite_peso}"
backpack = escolha_por_peso(dispensa, limite_peso)
puts "\nItens escolhidos"
puts "##########"
backpack.map{ |item| puts item.to_s}
puts "########"
puts "\nPeso da mochila: #{soma_peso(backpack)}"

puts "\n----------------------------------------"

puts "\nEscolher itens por lucro. Limite de peso #{limite_peso}"
backpack = escolha_por_valor(dispensa, limite_peso)
puts "\nItens escolhidos"
puts "##########"
backpack.map{ |item| puts item.to_s }
puts "##########"
puts "\nPeso da mochila: #{soma_peso(backpack)}"
puts "Valor total dos produtos: #{soma_valor(backpack)}"
