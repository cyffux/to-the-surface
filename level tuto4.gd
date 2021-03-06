extends Node2D

var activate = false
var velocitime=0

func _on_Area2D_body_entered(body):
	if activate == true:
		$button/AnimationPlayer.play("button press")
		$newlevel.queue_free()
		$button/Area2D.queue_free()
		get_parent().get_node("player").level=false
		get_parent().level=false
		activate = false

func _process(delta):
	if activate == false:
		position.y+=1
	if velocitime>0:
		velocitime-=1
	else:
		get_node("../player").jumper=false


func _on_VisibilityEnabler2D_screen_entered():
	activate = true
	get_parent().get_node("player").level=true
	get_parent().level=true


func _on_read_body_entered(body):
	get_parent().get_node("player").pause=true
	var child = load("res://read.tscn").instance()
	child.text="YOU CAN FIGHT THE CURSE WITH A POTION. BUT IT IS JUST TEMPORARY. THE CURSE MAY STILL COME"
	$wall/wall23.queue_free()
	$read.queue_free()
	get_parent().add_child(child)


func _on_VisibilityEnabler2D2_screen_exited():
	get_parent().newlevel()
	queue_free()


func _on_potion_body_entered(body):
	get_parent().get_node("player").cursed=false
	$potion.queue_free()
	$wall/potion.queue_free()
