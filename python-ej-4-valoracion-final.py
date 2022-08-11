# 4) Crear un lista en Python denominado “Perro2” que contenga los siguientes valores:

# 14,  Fido,  12/12/2012 , Macho, 23546987

# Recorrer la lista “Perro” con un bucle y mostrar sus elementos por pantalla , comenzando desde el último hasta el primero.

#idPerro2 podria ser la edad, pero el calculo de edad no coinciden con la actividad propuesta, por eso invente una variable genérica.

idPerro2=14
nombrePerro2="Fido"
fechaNacPerro2="12/12/2012"
sexoPerro2="Macho"
dniDueñoPerro2=23546987

#lista
Perro2=[14, "Fido", "12/12/2012", "Macho", 23546987]

#Recorrido normal + salida en pantalla - uso "\n" para separacion con salto de liínea.
for i in range(len(Perro2)):
        print(Perro2[i], end="\n")

print() #separo los dos bucles con una funcion vacía.

#Recorrido inverso + salida en pantalla - uso " " para separar los elementos de la lista con un espacio vacio.
for i in range(len(Perro2) -1, -1, -1):
        print(Perro2[i], end=" ")

