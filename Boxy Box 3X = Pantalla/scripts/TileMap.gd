extends TileMap


#coordenadas a modificar, supongamos que es una matriz de 50x50
var x = 25
var y = 25

#prueba para dibujar a pacman
#los sub arrays significan: 1 si se pinta, 0 si no, y luego el color
var pacm = [
			[0,0],[1,16],[1,16],[1,16],[0,0],
			[1,16],[1,16],[1,16],[1,16],[1,16],
			[1,16],[1,16],[1,16],[0,0],[0,0],
			[1,16],[1,16],[1,16],[1,16],[1,16],
			[0,0],[1,16],[1,16],[1,16],[0,0]
			]

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
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_down"):
		moverder(x,y,pacm)
		x+=1
		
	pass



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

func moverder(x1,y1,matriz):
	dibujar5x5(temporal5x5,x1,y1)
	guardar5x5(x1+1,y1)
	dibujar5x5(matriz,x1+1,y1)
	
	pass
