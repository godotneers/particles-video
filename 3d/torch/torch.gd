@tool
extends Node3D

@onready var gpu_particles_3d:Node3D = $GPUParticles3D

func _process(delta):
	gpu_particles_3d.global_rotation = Vector3.ZERO
