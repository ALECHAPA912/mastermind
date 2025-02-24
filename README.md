# mastermind

# TAREAS:
# Construya el juego asumiendo que la computadora selecciona aleatoriamente los colores secretos y el jugador humano debe adivinarlos. 
# ¡Recuerda que debes dar la información adecuada sobre qué tan acertada fue la suposición en cada turno!
# Ahora refactorice su código para permitir que el jugador humano elija si quiere ser el creador del código secreto o el que lo adivina.
# Constrúyelo para que la computadora adivine si decides elegir tus propios colores secretos. 
# Puedes optar por implementar una estrategia informática que siga las reglas del juego o puedes modificar estas reglas.
# Si decide modificar las reglas, puede proporcionarle a la computadora información adicional sobre cada suposición. 
# Por ejemplo, puede comenzar haciendo que la computadora adivine al azar, pero conserve las que coincidan exactamente. 
# Puede agregar un poco más de inteligencia al reproductor de la computadora de modo que, 
# si la computadora ha adivinado el color correcto pero la posición incorrecta, su próxima suposición deberá incluir ese color en alguna parte.
# Si quieres seguir las reglas del juego, necesitarás investigar estrategias para resolver Mastermind.
# ¡Publica tu solución a continuación!
# 
# VERSION 1.0 (HUMANO TIENE QUE ADIVINAR PATRON DADO POR LA MAQUINA)
# numeros del 0 al 5, el humano tiene 12 chances para adivinar el codigo
# 1: maquina genera el codigo random de 4 caracteres
# 2: humano ingresa para adivinar codigo
# 3: maquina chequea aciertos y fallos
# 4: si humano adivina codigo devuelve que humano gana
# 5: si no adivina, devuelve un string de 6 caracteres, ⚫ si acerto numero y posicion, ◯ si acerto numero pero no posicion y x si fallo
# 6: si se logra adivinar el codigo dentro de los 12 intentos humano gana, de lo contrario pierde.
#
# VERSION 2.0 (MAQUINA ADIVINA PATRON DADO POR EL HUMANO)
# la maquina intenta adivinar con 12 chances el codigo dado por el humano, conservando los aciertos y los demas numeros adivinarlos de manera aleatoria.
# 1: humano ingresa codigo de 4 caracteres
# 2: maquina genera codigo aleatorio
# 3: se compara codigo aleatorio con el codigo del humano
# 4: si hay aciertos, el caracter acertado se mantiene en la misma posicion y los errores nuevamente se generan aleatoriamente.
# 5: se repite este proceso hasta que se adivine el codigo.
# 6: si no se adivina el codigo dentro de los 12 intentos la computadora pierde.
#
# VERSION 2.1 (MEJORA DE LA IA PARA LA MAQUINA)
# se modifica el metodo randomCodeGuesser de la clase Computer para que pueda realizar la adivinanza de manera mas efectiva (creacion propia soy un capo).
#
# VERSION 2.2 (VERSION DEFINITIVA)
# se modifica y optimiza el metodo randomCodeGuesser aplicando la estrategia de Swaszek