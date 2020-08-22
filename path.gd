extends Node2D


var waitframe = 35

func _process(delta):
	if get_parent().level==false:
		waitframe-=1
		if waitframe<1:
			$position.position.y-=1
			waitframe=35
