extends Node2D




func _on_VisibilityEnabler2D_screen_exited():
	get_parent().rock()
	queue_free()


func _on_rock_body_entered(body):
	if "rock" in body.name:
		get_parent().rock()
		queue_free()


func _on_Area2D_body_entered(body):
	pass # Replace with function body.
