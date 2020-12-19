extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	alla()


func alla():
	var arr = []
	var tot = []
	for i in 51:
		for j in 51:
			arr.append(get_cell(i,j))
		tot.append(arr)
		arr = []
	print (tot)
