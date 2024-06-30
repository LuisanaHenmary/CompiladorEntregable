
*      Compilacion TINY para el codigo objeto TM
*      Archivo: NOMBRE_ARREGLAR
*      Preludio estandar:
0:       LD       6,0(0)      cargar la maxima direccion desde la localidad 0
1:       ST       0,0(0)      limpio el registro de la localidad 0
*      -> escribir
*      -> Operacion: mas
*      -> constante
2:       LDC       0,5(0)      cargar constante: 5
*      <- constante
3:       ST       0,0(6)      op: push en la pila tmp el resultado expresion izquierda
*      -> constante
4:       LDC       0,3(0)      cargar constante: 3
*      <- constante
5:       LD       1,0(6)      op: pop o cargo de la pila el valor izquierdo en AC1
6:       ADD       0,1,0      op: +
*      <- Operacion: mas
7:       OUT       0,0,0      escribir: genero la salida de la expresion
8:       HALT       0,0,0      
