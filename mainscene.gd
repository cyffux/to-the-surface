extends Node2D

var loadechelle=load("res://echelle.tscn")
var level = false
var over = false


func _ready():
	add_child(loadechelle.instance())
	var tuto=load("res://level tuto.tscn").instance()
	tuto.position.x = 494
	tuto.position.y=-200
	add_child(tuto)
	
func echelle():
	add_child(loadechelle.instance())


func _on_Area2D_body_entered(body):
	if over == false:
		if body.name=="player":
			$"audio/game over".play()
			$ui.visible=true
			over = true

func retry():
	get_tree().reload_current_scene()

func quit():
	get_tree().quit()
