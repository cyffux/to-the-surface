extends Node2D




func _on_VisibilityEnabler2D_screen_exited():
	get_parent().rock()
	queue_free()
