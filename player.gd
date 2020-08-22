extends KinematicBody2D

var echelle = 0
var level= false
var jump = false
var canjump=false
var pause = false
var velocite = Vector2()
var jumper=false
var cursed=false
var timerset=false
var cursednow=0
var cursesound=false

func _ready():
	$smoke/AnimationPlayer.play("smoke")
	$Sprite/AnimationPlayer.play("player")
	$AudioStreamPlayer.stream.loop=false

func _process(delta):
	velocite = Vector2()
	if cursed==true:
		if cursesound==false:
			$AudioStreamPlayer.play()
			cursesound=true
	else:
		cursesound=false
	if cursednow>0:
		if pause == false:
			$AudioStreamPlayer.play()
			var randmoove=randi()%3
			if randmoove==0:
				velocite=Vector2(5,0)
			if randmoove==1:
				velocite=Vector2(-5,0)
			if randmoove==2:
				velocite=Vector2(0,5)
			if randmoove==3:
				velocite=Vector2(0,-5)
			move_and_slide(velocite*60)
			cursednow-=1
			timerset=false
	else:
		if cursed==true:
			$smoke.visible=true
			if timerset==false:
				$"cursed timer".wait_time=rand_range(3,6)
				$"cursed timer".start()
				timerset=true
		else:
			timerset=false
			$"cursed timer".stop()
			$smoke.visible=false
		if pause ==false:
			if echelle>0:
				if Input.is_action_pressed("ui_up"):
					if position.y>10:
						velocite.y-=2
				if Input.is_action_pressed("ui_down"):
					if position.y<590:
						velocite.y+=2
			if Input.is_action_pressed("ui_left"):
				velocite.x-=1
			if Input.is_action_pressed("ui_right"):
				velocite.x+=1
			if echelle ==0:
				if Input.is_action_just_pressed("jump"):
					if canjump==true:
						jump=true
						$jumtimer.start()
				if Input.is_action_just_released("jump"):
					jump=false
				if jump == false:
					velocite.y+=2
				else:
					velocite.y-=3
			if jumper==true:
				velocite.y-=6
			move_and_slide(velocite*60)
		else:
			velocite.y+=2
			move_and_slide(velocite*60)


func _on_Area2D_area_entered(area):
	if "echelle" in area.name:
		echelle+=1


func _on_Area2D_area_exited(area):
	if "echelle" in area.name:
		echelle-=1


func _on_jumtimer_timeout():
	jump=false


func _on_Area2D_body_entered(body):
	if not "echelle" in body.name:
		canjump=true


func _on_Area2D_body_exited(body):
	canjump=false


func _on_cursed_timer_timeout():
	cursednow=20
	
