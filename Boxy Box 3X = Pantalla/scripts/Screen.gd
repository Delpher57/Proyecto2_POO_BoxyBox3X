extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print ("pantalla")
	set_network_master(get_tree().get_network_connected_peers()[0])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
remote func recibiendo_accion_presion(accion):
	print("recibido")
	get_node("TileMap").pruebamov(accion)
