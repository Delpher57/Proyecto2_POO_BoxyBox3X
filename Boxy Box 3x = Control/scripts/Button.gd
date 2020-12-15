extends TextureButton


signal presionado
var is_presionado = false
var waiter = false

export var accion = ""
var click


func _ready():
	get_node("Sprite").frame = 0


#boton soltado
func _on_Button_button_up():
	get_node("Sprite").frame = 0

	is_presionado = false
	pass # Replace with function body.

#boton se presiona
func _on_Button_button_down():
	get_node("Sprite").frame = 1
	
	is_presionado = true
	#yield(get_tree().create_timer(0.5), "timeout")
	
	pass # Replace with function body.



func _process(_delta):
	if is_presionado == true:
		if waiter == false:
			waiter = true
			emit_signal("presionado",accion)
			yield(get_tree().create_timer(0.05), "timeout")
			waiter = false
		
		pass
		#emit_signal("presionado",accion)
	pass
