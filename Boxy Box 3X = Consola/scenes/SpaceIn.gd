extends Button

#4242 es el adress para hablarle a la consola
#5252 es el adress para hablarle a la pantalla
var socket
var juego = preload ("res://SpaceInConsola.tscn")
var click

func _ready():
	print ("consola")
	_init()




func _init():
  socket = PacketPeerUDP.new()
  socket.set_dest_address("127.0.0.1",5252)





func _on_Pacman_pressed():
	print ("Empezando space invaders...")
	var spaceIngame = juego.instance()
	get_parent().add_child(spaceIngame)
	
