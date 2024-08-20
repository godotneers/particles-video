extends Node3D

@export var target_node:Node3D
@export var max_distance:float = 0.0
@export var max_speed:float = 1.0

var _last_position:Vector3
var _current_speed:float

func _ready():
	_last_position = global_position

func _physics_process(delta):
	var moved = global_position - _last_position
	moved.y = 0  # we don't care about movements in y direction
	_last_position = global_position
	
	var speed = moved.length() / delta
	var multiplier = lerpf(0, max_distance, speed / max_speed)
	var target_pos = global_position + (moved.normalized() * multiplier)
	target_node.global_position = target_pos
