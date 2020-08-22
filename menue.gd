extends Node2D

var time =0.0

func _ready():
	$AudioStreamPlayer2.stream.loop=false


func _process(delta):
	if time < 2:
		$title.position.x+=2
	if time > 2.5 and time <4.5:
		$begin.position.x+=5
	if time > 5 and time <7:
		$quit.position.x+=5
	if time >9 and time < 11:
		$"kenny jam".position.x-=6
	time+=delta


func _on_Button_pressed():
	get_tree().quit()


func _on_button2_pressed():
	get_tree().change_scene("res://mainscene.tscn")


func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.play()


func _on_button2_mouse_entered():
	$quit/button2.icon=load("res://sprites/ui/redbutton/redbutton2.png")
	$AudioStreamPlayer2.play()


func _on_button2_mouse_exited():
	$quit/button2.icon=load("res://sprites/ui/redbutton/redbutton1.png")


func _on_Button_mouse_entered():
	$begin/Button.icon=load("res://sprites/ui/redbutton/redbutton2.png")
	$AudioStreamPlayer2.play()


func _on_Button_mouse_exited():
	$begin/Button.icon=load("res://sprites/ui/redbutton/redbutton1.png")
