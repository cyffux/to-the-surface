extends Node

func _ready():
	$AudioStreamPlayer.stream.loop=false
	$AudioStreamPlayer2.stream.loop=false
	$AudioStreamPlayer3.stream.loop=false
	$AudioStreamPlayer4.stream.loop=false
	$AudioStreamPlayer5.stream.loop=false

func _on_Timer_timeout():
	if get_parent().over==false:
		if get_parent().level==false:
			var audio = randi()%4
			if audio==1:
				$AudioStreamPlayer.play()
			if audio==2:
				$AudioStreamPlayer2.play()
			if audio==3:
				$AudioStreamPlayer3.play()
			if audio==4:
				$AudioStreamPlayer4.play()
			if audio==0:
				$AudioStreamPlayer5.play()
