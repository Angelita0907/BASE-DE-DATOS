def validaDNI (dni):
    valido = False
    letraDni = ["T","R","W","A","G","M","Y","F","P","D","X","B","N","J","Z","S","Q","V","H","L","C","K","E"]
    letra = len(dni)-1
    for i in range():
        resto = i%23
        if letraDni[resto] == dni :
            valido = True 
        
    return valido

dni = input("Introduzca su DNI: ")

print(validaDNI)