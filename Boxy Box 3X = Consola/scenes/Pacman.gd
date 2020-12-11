extends Button

#4242 es el adress para hablarle a la consola
#5252 es el adress para hablarle a la pantalla
var socket
export var direccion = "res://PacmanConsola.tscn"
var click

func _ready():
	_init()




func _init():
  socket = PacketPeerUDP.new()
  socket.set_dest_address("127.0.0.1",5252)





func _on_Pacman_pressed():
	socket.put_packet("pacman".to_ascii())
	print ("Empezando pacman...")
	click = get_tree().change_scene(direccion)
	
