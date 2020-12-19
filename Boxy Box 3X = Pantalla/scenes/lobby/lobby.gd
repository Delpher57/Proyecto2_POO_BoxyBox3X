extends Control

var socket
var socketconsola

func _ready():
	get_node("control/TileMap").connect("colision",self,"avisar_colision")

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
				get_node("control/TileMap").personaje = data[1]
				get_node("control/TileMap").hay_fondo = true
				get_node("control/TileMap").limpiar_con_fondo = false
				get_node("control/TileMap").fondo = data[2]
				get_node("control/TileMap").inicializar()
			
			elif (data[0] == "frogger"):
				get_node("control/TileMap").personaje = data[1]
				get_node("control/TileMap").hay_fondo = true
				get_node("control/TileMap").limpiar_con_fondo = true
				get_node("control/TileMap").fondo = data[2]
				get_node("control/TileMap").inicializar()

			elif (data[0] == "moverse"):
				mover_sprite(data)
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

func mover_sprite(direccion):
	get_node("control/TileMap").mover(direccion[1],direccion[2],get_node("control/TileMap").personaje,direccion[4])
	
	#bolitas recogibles
	var points = get_node("control/TileMap").get_colores(direccion[3])
	socketconsola.put_var(["puntos",points])




func quit():
	socket.close()        
	print("Exiting application")    
	queue_free()
