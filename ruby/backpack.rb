#!/usr/bin/ruby

class Item

    def initialize(value, weight)
        @value=value
        @weight=weight
    end

    def value
        @value
    end

    def weight
        @weight
    end

end


def approachByProfit(backpack , maxweight)


    backpack2 = Array.new(backpack)
    actualwheight = 0
    valuesum = 0
    pick = true
    choosen = nil

    while(!backpack2.empty? && actualwheight <= maxweight && pick == true)

        pick = false
        biggestvalue = 0

        for i in backpack2
            if (biggestvalue <= i.value)
                if((actualwheight + i.weight) < maxweight)
                    biggestvalue = i.value
                    choosen = i
                    pick = true
                end
            end
        end

        if (pick == true)
            actualwheight = actualwheight + choosen.weight
            valuesum = valuesum + choosen.value
            backpack2.delete(choosen)
        end
    end

    puts "BIGGEST VALUE WITH VALUE APPROACH IS #{valuesum}"
end


def approachbyWheight(backpack , maxweight)

    backpack2 = Array.new(backpack)
    actualwheight = 0
    valuesum = 0
    pick = true
    choosen = nil

    while(!backpack2.empty? && actualwheight <= maxweight && pick == true)

        pick = false
        biggestvalue = maxweight

        for i in backpack2
            if (biggestvalue > i.weight)
                if((actualwheight + i.weight) < maxweight)
                    biggestvalue = i.weight
                    choosen = i
                    pick = true
                end
            end
        end

        if (pick == true)
            actualwheight = actualwheight + choosen.weight
            valuesum = valuesum + choosen.value
            backpack2.delete(choosen)
        end
    end

    puts "BIGGEST VALUE WITH WEIGHT APPROACH IS #{valuesum}"
end

def approachbyDensity(backpack , maxweight)

    backpack2 = Array.new(backpack)
    actualwheight = 0
    valuesum = 0
    pick = true
    choosen = nil

    while(!backpack2.empty? && actualwheight <= maxweight && pick == true)

        pick = false
        biggestvalue = 0

        for i in backpack2
            if (biggestvalue < (i.value / i.weight))
                if((actualwheight + i.weight) < maxweight)
                    biggestvalue = (i.value / i.weight)
                    choosen = i
                    pick = true
                end
            end
        end

        if (pick == true)
            actualwheight = actualwheight + choosen.weight
            valuesum = valuesum + choosen.value
            backpack2.delete(choosen)
        end
    end

    puts "BIGGEST VALUE WITH DENSITY APPROACH IS #{valuesum}"
end

backpack = []

limite_valor = 100
limite_peso = 100
limite_densidade = 100

(0..10).each do |i|
  backpack << Item.new(
    (0..100).to_a.sample,
    (0..100).to_a.sample
  )
end

backpack.map{ |item| puts "Valor: #{item.value} ; Peso: #{item.weight}"}

approachByProfit(backpack , limite_valor)
approachbyWheight(backpack, limite_peso)
approachbyDensity(backpack, limite_densidade)
