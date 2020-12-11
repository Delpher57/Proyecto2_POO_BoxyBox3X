extends Control

#puerto 4242 es la consola
#puerto 5252 es la pantalla
var socket

func _init():
	socket = PacketPeerUDP.new()
	if(socket.listen(4242,"127.0.0.1") != OK):
		print("An error occurred listening on port 4242")
		quit()
	else:
		print("Listening on port 4242 on localhost")


func _process(delta):
	if(socket.get_available_packet_count() > 0):
			var data = socket.get_packet().get_string_from_ascii()
			if(data == "quit"):
				quit()
			else:
				print("Data received: " + data)


func quit():
	socket.close()        
	print("Exiting application")    
	queue_free()
