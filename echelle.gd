extends Node2D


var ine=false


func _on_VisibilityEnabler2D_screen_entered():
	get_parent().echelle()



func _on_VisibilityEnabler2D_screen_exited():
	if ine ==true:
		get_node("../../player").echelle-=1
	queue_free()
