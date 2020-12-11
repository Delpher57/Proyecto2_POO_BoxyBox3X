extends Control

#puerto 4242 es la consola
#puerto 5252 es la pantalla
var socket
var socketpantalla

func _init():
	socket = PacketPeerUDP.new()
	if(socket.listen(4242,"127.0.0.1") != OK):
		print("An error occurred listening on port 4242")
		quit()
	else:
		print("Listening on port 4242 on localhost")

	
	socketpantalla = PacketPeerUDP.new()
	socketpantalla.set_dest_address("127.0.0.1",5252)


func _process(delta):
	if(socket.get_available_packet_count() > 0):
			var data = socket.get_packet().get_string_from_ascii()
			if(data == "quit"):
				quit()
			
			#recibimos los inputs
			if (data == "arriba"):
				arriba()
			if (data == "abajo"):
				abajo()
			if (data == "izquierda"):
				izquierda()
			if (data == "derecha"):
				derecha()
			else:
				print("Se recibio en la consola: " + data)


func arriba():
	pass

func abajo():
	pass

func izquierda():
	pass

func derecha():
	socketpantalla.put_packet("derecha".to_ascii())
	pass


func quit():
	socket.close()        
	print("Exiting application")    
	queue_free()

