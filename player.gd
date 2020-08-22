extends KinematicBody2D

var echelle = 0
var level= false
var jump = false
var canjump=false
var pause = false

func _on_Timer_timeout():
	if $miroir.visible==false:
		$miroir.visible=true
	else:
		$miroir.visible=false

func _process(delta):
	var velocite = Vector2()
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
		move_and_slide(velocite*60)
	else:
		velocite.y+=2
		move_and_slide(velocite*60)


func _on_Area2D_area_entered(area):
	echelle+=1


func _on_Area2D_area_exited(area):
	echelle-=1


func _on_jumtimer_timeout():
	jump=false


func _on_Area2D_body_entered(body):
	canjump=true


func _on_Area2D_body_exited(body):
	canjump=false
