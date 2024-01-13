extends Node2D

@export var speed: float = 100.0


func _ready():
	pass


func _process(delta):
	self.position.x += -speed * delta
