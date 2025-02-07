def imprimeMenu():
    print("1 -- Asignar coche a surtidor y repostar")
    print("2 -- Consultar estado de surtidor")
    print("3 -- Asignar precio al surtidor")
    print("4 -- Recargar surtidor")
    print("5 -- Cerrar el programa y salir")
    opcion = input("Indique que opción desea realizar: ").upper()
    while not(opcion== 1 or opcion== 2 or opcion== 3 or opcion== 4 or opcion== 5):
        print("1 -- Asignar coche a surtidor y repostar")
        print("2 -- Consultar estado de surtidor")
        print("3 -- Asignar precio al surtidor")
        print("4 -- Recargar surtidor")
        print("5 -- Cerrar el programa y salir")
        opcion = input("Indique que opción desea realizar: ").upper()
    return opcion

def validaMatricula(matricula):
    valida = False


    return valida

def opcion1():
    matricula = input()
    validaMatricula(matricula)
    tipo = input()
    dinero = input()

    litros = calculalitros(dinero,tipo)
    numerosurtidor = asignasurtidor(tipo)

    imprimeMensaje

opcion = imprimeMenu()
matricula = input("Indique su matrícula: ")