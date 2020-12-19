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

func quit():
	#socket.close()      
	#socketpantalla.close()  
	print("Exiting application")    
	queue_free()
