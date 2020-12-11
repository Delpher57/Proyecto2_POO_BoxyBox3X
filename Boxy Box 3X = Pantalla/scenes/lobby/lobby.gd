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
			var data = socket.get_packet().get_string_from_ascii()
			if(data == "quit"):
				quit()
			if (data == "izquierda"):
				get_node("control/TileMap").pruebamov("accion")
			else:
				print("recibido en pantalla: " + data)
				


func quit():
	socket.close()        
	print("Exiting application")    
	queue_free()
