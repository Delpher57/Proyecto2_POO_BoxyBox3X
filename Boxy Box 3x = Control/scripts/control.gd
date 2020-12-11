extends Node2D

#4242 es el adress para hablarle a la consola
#5252 es el adress para hablarle a la pantalla
var socket



func _init():
  socket = PacketPeerUDP.new()
  socket.set_dest_address("127.0.0.1",4242)

	
var botones = []

func _ready():
	add_botones()
	for boton in botones:
		boton.connect("presionado",self,"boton_presionado")
		boton.connect("soltado",self,"boton_soltado")
		
	pass


func add_botones():
	botones = [
		get_node("abajo"),
		get_node("arriba"),
		get_node("izquierda"),
		get_node("derecha"),
		
		get_node("rojo"),
	]
	pass

func boton_presionado(accion):
	print("Se ha presionado el boton > ",accion)
	socket.put_packet(accion.to_ascii())
	pass

func boton_soltado(accion):
	print("Se ha soltado el boton > ",accion)
	socket.put_packet("soltado".to_ascii())
	pass
