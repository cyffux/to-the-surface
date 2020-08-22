extends KinematicBody2D


var left=true


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite/AnimationPlayer.play("sulkwalk")


func _on_Area2D_body_entered(body):
	if body.name=="player":
		get_node("../../..").gameover()

func _physics_process(delta):
	if left==true:
		move_and_slide(Vector2(2,0)*20)
		var move=move_and_slide(Vector2(2,0))
		if move ==Vector2(0,0):
			left=false
	else:
		move_and_slide(Vector2(-2,0)*20)
		var move=move_and_slide(Vector2(-2,0))
		if move ==Vector2(0,0):
			left=true
	move_and_slide(Vector2(0,1)*60)
