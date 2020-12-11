extends TileMap


#coordenadas a modificar, supongamos que es una matriz de 50x50
var x = 25
var y = 25

var hay_fondo = false
var fondo


#prueba para dibujar a pacman
#los sub arrays significan: 1 si se pinta, 0 si no, y luego el color
var personaje

# la usamos para guardar el estado de la pantalla
var temporal5x5 = [
			[1,0],[1,0],[1,0],[1,0],[1,0],
			[1,0],[1,0],[1,0],[1,0],[1,0],
			[1,0],[1,0],[1,0],[1,0],[1,0],
			[1,0],[1,0],[1,0],[1,0],[1,0],
			[1,0],[1,0],[1,0],[1,0],[1,0]
			]

# Called when the node enters the scene tree for the first time.
func _ready():
	guardar5x5(25,25)
	limpiar_pantalla()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.



# funcion para imprimir un sprite de 5x5, un sprite es una matriz
# se reciben de parametros la matriz y las coordenadas
func dibujar5x5 (matriz,x1,y1):
	print ("imprimiendo sprite")
	
	var tempx = x1
	var tempy = y1
	var index = 0
	for i in 5:
		for j in 5:
			if matriz[index][0] != 0:
				set_cell(tempx,tempy,matriz[index][1],false,false)
			tempx += 1
			index += 1

		tempy += 1
		tempx = x1


#guardamos el estado de un area de 5x5
func guardar5x5 (x1,y1):
	print ("guardando area")
	
	var tempx = x1
	var tempy = y1
	var index = 0
	for i in 5:
		for j in 5:
			temporal5x5[index][1] = get_cell(tempx,tempy)
			tempx += 1
			index += 1

		tempy += 1
		tempx = x1



func limpiar_pantalla():
	for i in 51:
		for j in 51:
			set_cell(i,j,4,false,false)

#imprimimos una matriz de 51x51 en toda la pantalla
func imprimir_completo():
	
	for i in 51:
		for j in 51:
			set_cell(i,j,fondo[i][j],false,false)
			

#movemos un sprite de 5x5
func mover(x1,y1,matriz):
	if hay_fondo == true:
		imprimir_completo()
	else:
		limpiar_pantalla()
	dibujar5x5(matriz,x1,y1)
	pass

func send_color(x1,y1):
	return get_cell(x1,y1)
