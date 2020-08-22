extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func rock():
	get_parent().rock()

func _process(delta):
	position.y+=0.5
