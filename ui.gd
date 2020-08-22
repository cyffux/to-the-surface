extends Node2D

func _ready():
	$AudioStreamPlayer.stream.loop=false

func _on_recommencer_mouse_entered():
	$recommencer.icon=load("res://sprites/ui/redbutton/redbutton2.png")
	$AudioStreamPlayer.play()


func _on_recommencer_mouse_exited():
	$recommencer.icon=load("res://sprites/ui/redbutton/redbutton1.png")


func _on_quitter_mouse_entered():
	$quitter.icon=load("res://sprites/ui/redbutton/redbutton2.png")
	$AudioStreamPlayer.play()

func _on_quitter_mouse_exited():
	$quitter.icon=load("res://sprites/ui/redbutton/redbutton1.png")


func _on_recommencer_pressed():
	get_parent().retry()


func _on_quitter_pressed():
	get_tree().quit()
