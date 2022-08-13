Historial3 = (9530,4120,4580,1500,890,7516,426)
suma= 0
i =0
    
for elemento in Historial3:
    suma += elemento
    i += 1

promedio = suma / i
print (promedio)

if promedio >  4500:
    print ("SE HA EXCEDIDO DEL GASTO PROMEDIO PARA SU MASCOTA")
    