extends TileMap


#coordenadas a modificar, supongamos que es una matriz de 50x50
var x = 25
var y = 25

var hay_fondo = false
var limpiar_con_fondo = false
var fondo

signal colision
signal colision2


#los sub arrays significan: 1 si se pinta, 0 si no, y luego el color
var personaje = []

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
	pass



func inicializar():
	if hay_fondo == true:
		imprimir_completo()
	else:
		limpiar_pantalla()



# funcion para imprimir un sprite de 5x5, un sprite es una matriz
# se reciben de parametros la matriz y las coordenadas
func dibujar5x5 (matriz,x1,y1):
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


#limpiamos un area de 5x5
func limpiar5x5 (x1,y1):
	
	var tempx = x1
	var tempy = y1
	for i in 5:
		for j in 5:
			set_cell(tempx,tempy,4,false,false)
			tempx += 1

		tempy += 1
		tempx = x1


#limpiamos la pantalla
func limpiar_pantalla():
	for i in 51:
		for j in 51:
			set_cell(i,j,4,false,false)

#imprimimos una matriz de 51x51 en toda la pantalla
func imprimir_completo():
	for i in 51:
		for j in 51:
			set_cell(i,j,fondo[i][j],false,false)

#imprimimos una parte del fondo especifica 5x5
func limpiar_especifico5x5(x1,y1):
	var tempx = x1
	var tempy = y1
	for i in 5:
		for j in 5:
			set_cell(tempx,tempy,fondo[tempx][tempy],false,false)
			tempx += 1

		tempy += 1
		tempx = x1

func get_colision(x1,y1,id):
	var tempx = x1
	var tempy = y1
	for i in 5:
		for j in 5:
			if get_cell(tempx,tempy) == id:
				return true
			tempx += 1

		tempy += 1
		tempx = x1
	return false


func guardar5x5(x1,y1):
	var tempx = x1
	var tempy = y1
	var index = 0
	for i in 5:
		for j in 5:
			temporal5x5[index][0] = get_cell(tempx,tempy)
			tempx += 1
			index += 1

		tempy += 1
		tempx = x1


func mover1x1(x1,y1,color,color_colision,xa,ya):
	if get_cell(x1,y1) == color_colision:
		emit_signal("colision2",y1)
		return
	set_cell(xa,ya,fondo[xa][ya])
	set_cell(x1,y1,color)
	
	

#movemos un sprite de 5x5
func mover(x1,y1,matriz,colision_id,hacercoli,xa,ya):
	
	if hacercoli == true:
		if get_colision(x1,y1,colision_id):
			emit_signal("colision")
			limpiar_especifico5x5(xa,ya)
			return
	if limpiar_con_fondo == false:
		limpiar5x5(xa,ya)
	else:
		pass
		limpiar_especifico5x5(xa,ya)
		#imprimir_completo()
		
	dibujar5x5(matriz,x1,y1)
	pass

#retornamos array con cierto color
func get_colores(id):
	var tiles = get_used_cells_by_id(id)
	return tiles





