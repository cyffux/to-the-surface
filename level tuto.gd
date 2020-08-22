extends Node2D

var activate = false

func _on_Area2D_body_entered(body):
	$button/AnimationPlayer.play("button press")
	$newlevel.queue_free()
	$button/Area2D.queue_free()
	get_parent().get_node("player").level=false
	get_parent().level=false
	activate = false

func _process(delta):
	if activate == false:
		position.y+=1


func _on_VisibilityEnabler2D_screen_entered():
	activate = true
	get_parent().get_node("player").level=true
	get_parent().level=true


func _on_read_body_entered(body):
	get_parent().get_node("player").pause=true
	var child = load("res://read.tscn").instance()
	child.text="FOR COMPLETE A LEVEL, PUSH THE BUTTON. DON'T FORGET TO TAKE THE LADDER FAST AFTER YOU PUSH THE BUTTON"
	$wall/wall23.queue_free()
	$read.queue_free()
	get_parent().add_child(child)


func _on_VisibilityEnabler2D2_screen_exited():
	queue_free()
