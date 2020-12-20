extends Control

var socket
var socketconsola

func _ready():
	get_node("control/TileMap").connect("colision",self,"avisar_colision")
	get_node("control/TileMap").connect("colision2",self,"avisar_colision2")

func _init():
	socket = PacketPeerUDP.new()
	if(socket.listen(5252,"127.0.0.1") != OK):
		print("An error occurred listening on port 5252")
		quit()
	else:
		print("Listening on port 5252 on localhost")
	
	socketconsola = PacketPeerUDP.new()
	socketconsola.set_dest_address("127.0.0.1",4242)


func _process(_delta):
	if(socket.get_available_packet_count() > 0):
			var data = socket.get_var()
			
			if(data[0] == "quit"):
				quit()
			
				
			elif (data[0] == "pacman"):
				get_node("control/TileMap").personaje.clear()
				get_node("control/TileMap").personaje.resize(0)
				
				
				get_node("control/TileMap").personaje.append(data[1])
				get_node("control/TileMap").hay_fondo = true
				get_node("control/TileMap").limpiar_con_fondo = false
				get_node("control/TileMap").fondo = data[2]
				get_node("control/TileMap").inicializar()
			
			elif (data[0] == "frogger"):
				get_node("control/TileMap").personaje.clear()
				get_node("control/TileMap").personaje.resize(0)
				
				
				get_node("control/TileMap").personaje.append(data[1])
				get_node("control/TileMap").personaje.append(data[3])
				get_node("control/TileMap").hay_fondo = true
				get_node("control/TileMap").limpiar_con_fondo = true
				get_node("control/TileMap").fondo = data[2]
				get_node("control/TileMap").inicializar()
			
			elif (data[0] == "space"):
				get_node("control/TileMap").personaje.clear()
				get_node("control/TileMap").personaje.resize(0)
				
				
				get_node("control/TileMap").personaje.append(data[1])
				get_node("control/TileMap").personaje.append(data[3])
				get_node("control/TileMap").personaje.append(data[4])
				get_node("control/TileMap").hay_fondo = true
				get_node("control/TileMap").limpiar_con_fondo = true
				get_node("control/TileMap").fondo = data[2]
				get_node("control/TileMap").inicializar()

			elif (data[0] == "moverse"):
				mover_sprite(data)
			elif (data[0] == "mov_pix"):
				get_node("control/TileMap").mover1x1(data[1],data[2],data[3],data[4],data[5],data[6])
			elif (data[0] == "set_fondo"):
				get_node("control/TileMap").hay_fondo = true
				get_node("control/TileMap").fondo = data[1]
				get_node("control/TileMap").inicializar()
			else:
				print("recibido en pantalla: " + data[0])
				
func set_fondo(fondo):
	get_node("control/TileMap").hay_fondo = true
	get_node("control/TileMap").fondo = fondo
	get_node("control/TileMap").imprimir_completo()


func avisar_colision():
	socketconsola.put_var(["colision"])

func avisar_colision2(y1):
	socketconsola.put_var(["colision2",y1])

func mover_sprite(direccion):
	if direccion[5] == 0:
		get_node("control/TileMap").mover(direccion[1],direccion[2],get_node("control/TileMap").personaje[direccion[5]],direccion[4],true,direccion[6],direccion[7])
	elif direccion[5] != 0:
		get_node("control/TileMap").mover(direccion[1],direccion[2],get_node("control/TileMap").personaje[direccion[5]],direccion[4],false,direccion[6],direccion[7])
		
	#bolitas recogibles
	var points = get_node("control/TileMap").get_colores(direccion[3])
	socketconsola.put_var(["puntos",points])




func quit():
	socket.close()        
	print("Exiting application")    
	queue_free()
