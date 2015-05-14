#!/usr/bin/ruby

class Item

    def initialize(value, wheight)
        @value=value
        @wheight=wheight
    end

    def value
        @value
    end

    def wheight
        @wheight
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
                if((actualwheight + i.wheight) < maxweight)
                    biggestvalue = i.value
                    choosen = i
                    pick = true
                end
            end
        end

        if (pick == true)
            actualwheight = actualwheight + choosen.wheight
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
            if (biggestvalue > i.wheight)
                if((actualwheight + i.wheight) < maxweight)
                    biggestvalue = i.wheight
                    choosen = i
                    pick = true
                end
            end
        end

        if (pick == true)
            actualwheight = actualwheight + choosen.wheight
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
            if (biggestvalue < (i.value / i.wheight))
                if((actualwheight + i.wheight) < maxweight)
                    biggestvalue = (i.value / i.wheight)
                    choosen = i
                    pick = true
                end
            end
        end

        if (pick == true)
            actualwheight = actualwheight + choosen.wheight
            valuesum = valuesum + choosen.value
            backpack2.delete(choosen)
        end
    end

    puts "BIGGEST VALUE WITH DENSITY APPROACH IS #{valuesum}"
end


backpack= Array.new()

r = Random.new

for i in 0..2
   backpack << Item.new(r.rand(100),r.rand(100))
end

for i in backpack
   puts "VALOR = #{i.value}"
   puts "PESO = #{i.wheight}"
end

approachByProfit(backpack , 100)
approachbyWheight(backpack, 100)
approachbyDensity(backpack, 100)