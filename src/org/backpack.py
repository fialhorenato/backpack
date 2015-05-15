from itertools import combinations

def anycomb(items):
    ' return combinations of any length from the items '
    return ( comb
             for r in range(1, len(items)+1)
             for comb in combinations(items, r)
             )

def totalvalue(comb):
    ' Totalise a particular combination of items'
    totwt = totval = 0
    for item, wt, val in comb:
        totwt  += wt
        totval += val
    return (totval, -totwt) if totwt <= 300 else (0, 0)

items = (
    ("Mapa", 9, 150),
    ("Bussula", 13, 35),
    ("Agua", 153, 200),
    ("Sanduiche", 50, 160),
    ("banana", 27, 60),
    ("Maca", 39, 40),
    ("Queijo", 23, 30),
    ("Cerveja", 52, 10),
    ("Camera", 32, 30),
    ("Telefone", 24, 15),
    ("Carne moida", 48, 10),
    ("Guarda-chuvas", 73, 40),
    ("Bota Timberland", 43, 75),
    ("Acai 2kg", 22, 20),
    ("Oculos escuros", 7, 20)
    )

bagged = max( anycomb(items), key=totalvalue) # max val or min wt if values equal

print("Adicionados os seguintes itens\n  " +
      '\n  '.join(sorted(item for item,_,_ in bagged)))
val, wt = totalvalue(bagged)

print("Valor total: %i Peso total: %i" % (val, -wt))
