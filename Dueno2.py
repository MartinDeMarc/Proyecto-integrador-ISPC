# lista Dueño2

Dueno2 = [23546987, "Maria", "Perez", 4789689, "Pueyrredon 811"]

Dueno2 = [x for (i,x) in enumerate(Dueno2)if i not in (0,2)] 
print(Dueno2)