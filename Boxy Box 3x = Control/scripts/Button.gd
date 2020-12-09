extends TextureButton


signal presionado
signal soltado


export var accion = ""
var click


func _ready():
	get_node("Sprite").frame = 0


#boton soltado
func _on_Button_button_up():
	#print ("se soltó el boton: ", accion)
	get_node("Sprite").frame = 0
	emit_signal("soltado",accion)
	pass # Replace with function body.

#boton se presiona
func _on_Button_button_down():
	#print ("se presionó el boton: ", accion)
	get_node("Sprite").frame = 1
	emit_signal("presionado",accion)
	pass # Replace with function body.
