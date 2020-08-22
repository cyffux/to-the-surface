extends Node2D

var rock1=load("res://rock1.tscn")
var rock2=load("res://rock2.tscn")
var rock3=load("res://rock3.tscn")
var rock4=load("res://rock4.tscn")

func _process(delta):
	if get_parent().get_parent().level==false:
		for i in get_children():
			i.position.y+=0.5

func rock():
	var rocktype = randi()%3
	if rocktype == 1 :
		var child = rock1.instance()
		child.position.x = rand_range(20,1000)
		child.position.y = -20
		add_child(child)
	if rocktype == 2 :
		var child = rock2.instance()
		child.position.x = rand_range(20,1000)
		child.position.y = -20
		add_child(child)
	if rocktype == 3 :
		var child = rock3.instance()
		child.position.x = rand_range(20,1000)
		child.position.y = -20
		add_child(child)
	if rocktype == 0 :
		var child = rock4.instance()
		child.position.x = rand_range(20,1000)
		child.position.y = -20
		add_child(child)
