extends Node2D

var loadechelle=load("res://echelle.tscn")
var level = false
var over = false
var leveln=0
var stop = false
var switchsound = true


func _process(delta):
	if level==false:
		if switchsound==false:
			$audio/AudioStreamPlayer6.play()
			switchsound=true
	else:
		switchsound=false

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
		stop = true
		$audio/musique.stop()
		$"audio/game over".play()
		$ui.visible=true
		over = true
		$player.pause=true

func retry():
	get_tree().reload_current_scene()

func quit():
	get_tree().quit()

func newlevel():
	if leveln==12:
		$player.level=true
		level=true
		var child=load("res://read.tscn").instance()
		child.text="WHEN YOU GO IN THE SURFACE, YOU SACRIFICED YOUR LIFE. IN THE SAME TIME YOU DESTRUCT THE CURSE. YOU SAVE THE HUMANITY. CONGRATULATION. THANK YOU FOR PLAYING MY GAME"
		add_child(child)
	if leveln==11:
		leveln+=1
		var tuto=load("res://level9.tscn").instance()
		tuto.position.x = 494
		tuto.position.y=-400
		add_child(tuto)
	if leveln==10:
		leveln+=1
		var tuto=load("res://level8.tscn").instance()
		tuto.position.x = 494
		tuto.position.y=-400
		add_child(tuto)
	if leveln==9:
		leveln+=1
		var tuto=load("res://level7.tscn").instance()
		tuto.position.x = 494
		tuto.position.y=-400
		add_child(tuto)
	if leveln==8:
		leveln+=1
		var tuto=load("res://level6.tscn").instance()
		tuto.position.x = 494
		tuto.position.y=-400
		add_child(tuto)
	if leveln==7:
		leveln+=1
		var tuto=load("res://level5.tscn").instance()
		tuto.position.x = 494
		tuto.position.y=-400
		add_child(tuto)
	if leveln==6:
		leveln+=1
		var tuto=load("res://level4.tscn").instance()
		tuto.position.x = 494
		tuto.position.y=-400
		add_child(tuto)
	if leveln==5:
		leveln+=1
		var tuto=load("res://level3.tscn").instance()
		tuto.position.x = 494
		tuto.position.y=-400
		add_child(tuto)
	if leveln==4:
		leveln+=1
		var tuto=load("res://level2.tscn").instance()
		tuto.position.x = 494
		tuto.position.y=-400
		add_child(tuto)
	if leveln==3:
		leveln+=1
		var tuto=load("res://level1.tscn").instance()
		tuto.position.x = 494
		tuto.position.y=-400
		add_child(tuto)
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


func _on_musique_finished():
	if stop == false:
		$audio/musique.play()
