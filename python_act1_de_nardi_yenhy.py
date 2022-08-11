dni = 28957346
nombre = "Juan" 
apellido = "Perez"
telefono = 4789689
direccion = "Belgrano 101"

dueno = [dni, nombre, apellido, telefono, direccion]

def verificar_informacion (dni):
  if dni >= 26000000:
   print(telefono)
  else:
    print("no hay telefono")


verificar_informacion(dni)
