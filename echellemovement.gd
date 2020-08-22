extends Node2D


# Called when the node enters the scene tree for the first time.
func _process(delta):
	if get_parent().get_parent().level==false:
		position.y+=1
