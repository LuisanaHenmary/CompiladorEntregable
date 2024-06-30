
*      Compilacion TINY para el codigo objeto TM
*      Archivo: NOMBRE_ARREGLAR
*      Preludio estandar:
0:       LD       6,0(0)      cargar la maxima direccion desde la localidad 0
1:       ST       0,0(0)      limpio el registro de la localidad 0

*      -> if
*      -> Operacion: or
*      -> Operacion: menor
*      -> constante
2:       LDC       0,1(0)      cargar constante: 1
*      <- constante
3:       ST       0,0(6)      op: push en la pila tmp el resultado expresion izquierda
*      -> constante
4:       LDC       0,2(0)      cargar constante: 2
*      <- constante
5:       LD       1,0(6)      op: pop o cargo de la pila el valor izquierdo en AC1
6:       SUB       0,1,0      op: <
7:       JLT       0,2(7)      voy dos instrucciones mas alla if verdadero (AC<0)
8:       LDC       0,0(0)      caso de falso (AC=0)
9:       LDA       7,1(7)      Salto incodicional a direccion: PC+1 (es falso evito colocarlo verdadero)
10:       LDC       0,1(0)      caso de verdadero (AC=1)
*      <- Operacion: menor
11:       ST       0,0(6)      op: push en la pila tmp el resultado expresion izquierda
*      -> Operacion: mayor
*      -> constante
12:       LDC       0,3(0)      cargar constante: 3
*      <- constante
13:       ST       0,-1(6)      op: push en la pila tmp el resultado expresion izquierda
*      -> constante
14:       LDC       0,6(0)      cargar constante: 6
*      <- constante
15:       LD       1,-1(6)      op: pop o cargo de la pila el valor izquierdo en AC1
16:       SUB       0,1,0      op: >
17:       JGT       0,2(7)      voy dos instrucciones mas alla if verdadero (AC>0)
18:       LDC       0,0(0)      caso de falso (AC=0)
19:       LDA       7,1(7)      Salto incondicional a direccion: PC+1 (es falso evito colocarlo verdadero)
20:       LDC       0,1(0)      caso de verdadero (AC=1)
*      <- Operacion: mayor
21:       LD       1,0(6)      op: pop o cargo de la pila el valor izquierdo en AC1
22:       JNE       0,2(7)      OR: short-circuit if left operand is true
23:       ADD       1,0,0      copy AC to AC1
*      -> Operacion: mayor
*      -> constante
24:       LDC       0,3(0)      cargar constante: 3
*      <- constante
25:       ST       0,0(6)      op: push en la pila tmp el resultado expresion izquierda
*      -> constante
26:       LDC       0,6(0)      cargar constante: 6
*      <- constante
27:       LD       1,0(6)      op: pop o cargo de la pila el valor izquierdo en AC1
28:       SUB       0,1,0      op: >
29:       JGT       0,2(7)      voy dos instrucciones mas alla if verdadero (AC>0)
30:       LDC       0,0(0)      caso de falso (AC=0)
31:       LDA       7,1(7)      Salto incondicional a direccion: PC+1 (es falso evito colocarlo verdadero)
32:       LDC       0,1(0)      caso de verdadero (AC=1)
*      <- Operacion: mayor
33:       ADD       0,1,0      op: OR (AC1 + AC)
34:       JNE       0,2(7)      OR: result is true if either operand is true
35:       LDC       0,0(0)      OR: result is false (AC=0)
36:       LDA       7,1(7)      unconditional jump (skip true case)
37:       LDC       0,1(0)      OR: result is true (AC=1)
*      <- Operacion: or
*      If: el salto hacia el else debe estar aqui
*      -> escribir
*      -> constante
39:       LDC       0,10(0)      cargar constante: 10
*      <- constante
40:       OUT       0,0,0      escribir: genero la salida de la expresion
*      <- escribir
*      If: el salto hacia el final debe estar aqui
38:       JEQ       0,3(7)      if: jmp hacia else
*      -> escribir
*      -> constante
42:       LDC       0,7(0)      cargar constante: 7
*      <- constante
43:       OUT       0,0,0      escribir: genero la salida de la expresion
*      <- escribir
41:       LDA       7,2(7)      if: jmp hacia el final
*      <- if

*      Fin de la ejecucion.
44:       HALT       0,0,0      