extends Node2D

var pipe_list = []

var pipe = preload("res://nodes/double_pipe.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	var instance = pipe.instantiate()
	add_child(instance)
	pipe_list.append(instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
