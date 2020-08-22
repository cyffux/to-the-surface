extends Node2D


var time = 0
var order=1.0
var text=""

func _ready():
	$AudioStreamPlayer.stream.loop=false
	$AudioStreamPlayer2.stream.loop=false
	$AudioStreamPlayer3.stream.loop=false
	$AudioStreamPlayer2.play()


func _process(delta):
	time+=delta
	if time <2.5:
		$Node2D/Sprite.scale.y+=0.02*order
		$Node2D/Sprite.position.y-=0.02*order
	else:
		$Node2D2/Label.text=text
		$Node2D2/Label.visible=true
		$Button.visible=true
		if order<0:
			get_parent().get_node("player").pause=false
			if get_parent().leveln==12:
				get_tree().quit()
			queue_free()


func _on_Button_mouse_entered():
	$Button.icon=load("res://sprites/ui/green button/green button 1.png")
	$AudioStreamPlayer.play()


func _on_Button_mouse_exited():
	$Button.icon=load("res://sprites/ui/green button/green button 2.png")


func _on_Button_pressed():
	order=-1.0
	time=0
	$Button.visible=false
	$Node2D2/Label.visible=false
	$AudioStreamPlayer3.play()
