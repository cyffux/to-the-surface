extends Node2D

var loadechelle=load("res://echelle.tscn")
var level = false
var over = false
var leveln=0


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
			gameover()

func gameover():
	if over == false:
		$"audio/game over".play()
		$ui.visible=true
		over = true
		$player.pause=true

func retry():
	get_tree().reload_current_scene()

func quit():
	get_tree().quit()

func newlevel():
	if leveln==2:
		leveln+=1
		var tuto=load("res://level tuto4.tscn").instance()
		tuto.position.x = 494
		tuto.position.y=-400
		add_child(tuto)
	if leveln==1:
		leveln+=1
		var tuto=load("res://level tuto3.tscn").instance()
		tuto.position.x = 494
		tuto.position.y=-400
		add_child(tuto)
	if leveln==0:
		leveln+=1
		var tuto=load("res://level tuto2.tscn").instance()
		tuto.position.x = 494
		tuto.position.y=-200
		add_child(tuto)
