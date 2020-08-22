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
	child.text="IF YOU ARE HERE,YOU ARE CURSED! MONSTERS ARE LIVING UNDER THE SURFACE OF THE EARTH"
	$wall/wall23.queue_free()
	$read.queue_free()
	get_parent().add_child(child)


func _on_VisibilityEnabler2D2_screen_exited():
	get_parent().newlevel()
	queue_free()

func _on_jumper_body_entered(body):
	if body.name=="player":
		$wall/jumper/AnimationPlayer.play("jump")
		get_node("../player").jumper=true
		velocitime=30
		$sound/AudioStreamPlayer.play()


func _on_smoke_body_entered(body):
	get_node("../player").cursed=true
	$smoke.queue_free()
	$wall/smoke.queue_free()


func _on_Area2D2_body_entered(body):
	if body.name=="player":
		$wall/jumper2/AnimationPlayer.play("jump")
		get_node("../player").jumper=true
		velocitime=30
		$sound/AudioStreamPlayer.play()


func _on_jumper3_body_entered(body):
	if body.name=="player":
		$wall/jumper3/AnimationPlayer.play("jump")
		get_node("../player").jumper=true
		velocitime=30
		$sound/AudioStreamPlayer.play()


func _on_Area2D3_body_entered(body):
	if body.name=="player":
		$wall/jumper4/AnimationPlayer.play("jump")
		get_node("../player").jumper=true
		velocitime=30
		$sound/AudioStreamPlayer.play()


func _on_Area2D4_body_entered(body):
	if body.name=="player":
		$wall/jumper5/AnimationPlayer.play("jump")
		get_node("../player").jumper=true
		velocitime=30
		$sound/AudioStreamPlayer.play()


func _on_Area2D5_body_entered(body):
	if body.name=="player":
		$wall/jumper6/AnimationPlayer.play("jump")
		get_node("../player").jumper=true
		velocitime=30
		$sound/AudioStreamPlayer.play()


func _on_Area2D6_body_entered(body):
	if body.name=="player":
		$wall/jumper7/AnimationPlayer.play("jump")
		get_node("../player").jumper=true
		velocitime=30
		$sound/AudioStreamPlayer.play()


func _on_Area2D7_body_entered(body):
	if body.name=="player":
		$wall/jumper8/AnimationPlayer.play("jump")
		get_node("../player").jumper=true
		velocitime=30
		$sound/AudioStreamPlayer.play()
