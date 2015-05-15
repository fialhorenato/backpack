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

def escolha_por_peso(dispensa, limite)
  backpack = []
  menor_valor = 99999
  pick = false

  loop do
    choosen = nil

    dispensa.each do |item|
      if item.peso < menor_valor
        menor_valor = item.peso
        choosen = item
        pick = true
      end
    end

    break if soma_peso(backpack) + menor_valor > limite || !pick

    # Index do item escolhido
    idx = dispensa.index(choosen)
    
    # Remove o item escolhido da dispensa   
    (dispensa.length-1).downto(0){ |i|
      dispensa.delete_at( i ) if i == idx
    }

    # Adiciona o item na mochila
    backpack << choosen if choosen != nil
    pick = false
    menor_valor = 9999
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
      (5..100).to_a.sample,
      (5..100).to_a.sample
    )
end

# Mostra como esta a dispensa
dispensa.map{ |item| puts item.to_s }

puts "\nPeso total da dispensa: #{soma_peso(dispensa)}"
puts "\nEscolher itens por peso. Limite de peso #{limite_peso}"

# Faz a escolha baseado no peso
backpack = escolha_por_peso(dispensa, limite_peso)

puts "\n\nItens escolhidos"

# Mostra como ficou a mochila
backpack.map{ |item| puts item.to_s}

puts "\n\nPeso da mochila: #{soma_peso(backpack)}"

