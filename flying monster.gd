extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite/AnimationPlayer.play("flying monster")

func _process(delta):
	if get_parent().get_node("player").pause==false:
		if get_parent().level==false:
			position.x-=3


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D_body_entered(body):
	if body.name == "player":
		get_parent().gameover()
