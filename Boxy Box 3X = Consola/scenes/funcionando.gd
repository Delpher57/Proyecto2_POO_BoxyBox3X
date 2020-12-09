extends Sprite

func _ready():
	print ("consola")
	
	set_network_master(get_tree().get_network_connected_peers()[0])
# Synchronize position and speed to the other peers.
remote func boton_presionado_network(accion):
	print("presion!")
	rpc("recibiendo_accion_presion", accion)

# Synchronize position and speed to the other peers.
remote func boton_soltado_network(accion):
	print("suelta!")
	rpc("soltando_accion_presion", accion)


func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		print ("arriba")
		rpc("recibiendo_accion_presion", "accion")
