extends Control

var socket

func _init():
	socket = PacketPeerUDP.new()
	if(socket.listen(5252,"127.0.0.1") != OK):
		print("An error occurred listening on port 5252")
		quit()
	else:
		print("Listening on port 5252 on localhost")


func _process(_delta):
	if(socket.get_available_packet_count() > 0):
			var data = socket.get_var()
			
			if(data[0] == "quit"):
				quit()
			if (data[0] == "pacman"):
				get_node("control/TileMap").personaje = data[1]
				get_node("control/TileMap").hay_fondo = true
				get_node("control/TileMap").fondo = data[2]
			if (data[0] == "moverse"):
				mover_sprite(data)
			else:
				print("recibido en pantalla: " + data[0])
				

func mover_sprite(direccion):

	print ("la direccion nueva es: ",direccion[1], "," , direccion[2])
	get_node("control/TileMap").mover(direccion[1],direccion[2],get_node("control/TileMap").personaje)
	

func quit():
	socket.close()        
	print("Exiting application")    
	queue_free()
