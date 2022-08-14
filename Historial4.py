Historial4 = (7510, 7960, 76180, 800, 4100);
valor_min = Historial4[0];

for i in Historial4:
    if valor_min > i:
        valor_min = i;
        
print("El valor mínimo de atención gastada en Olivia es: $", valor_min) 
