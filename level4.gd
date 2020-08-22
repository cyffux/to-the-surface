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

func _on_VisibilityEnabler2D2_screen_exited():
	get_parent().newlevel()
	queue_free()

func _on_jumper_body_entered(body):
	if body.name=="player":
		$wall/jumper2/AnimationPlayer.play("jump")
		get_node("../player").jumper=true
		velocitime=30
		$sound/AudioStreamPlayer.play()


func _on_smoke_body_entered(body):
	get_node("../player").cursed=true
	$smoke.queue_free()
	$wall/smoke.queue_free()


func _on_jumper2_body_entered(body):
	if body.name=="player":
		$wall/jumper3/AnimationPlayer.play("jump")
		get_node("../player").jumper=true
		velocitime=30
		$sound/AudioStreamPlayer.play()


func _on_jumper3_body_entered(body):
	if body.name=="player":
		$wall/jumper5/AnimationPlayer.play("jump")
		get_node("../player").jumper=true
		velocitime=30
		$sound/AudioStreamPlayer.play()


func _on_jumper4_body_entered(body):
	if body.name=="player":
		$wall/jumper6/AnimationPlayer.play("jump")
		get_node("../player").jumper=true
		velocitime=30
		$sound/AudioStreamPlayer.play()


func _on_jumper5_body_entered(body):
	if body.name=="player":
		$wall/jumper8/AnimationPlayer.play("jump")
		get_node("../player").jumper=true
		velocitime=30
		$sound/AudioStreamPlayer.play()


func _on_jumper6_body_entered(body):
	if body.name=="player":
		$wall/jumper9/AnimationPlayer.play("jump")
		get_node("../player").jumper=true
		velocitime=30
		$sound/AudioStreamPlayer.play()


func _on_jumper7_body_entered(body):
	if body.name=="player":
		$wall/jumper10/AnimationPlayer.play("jump")
		get_node("../player").jumper=true
		velocitime=30
		$sound/AudioStreamPlayer.play()
