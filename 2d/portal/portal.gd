extends Node2D

@export_node_path("Node2D") var target:NodePath = "."

@onready var target_position:Vector2 = get_node(target).global_position


func _on_area_2d_body_entered(body:PhysicsBody2D):
	body.global_position = target_position
