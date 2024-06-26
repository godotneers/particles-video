@tool
extends Node3D

@onready var omni_light_3d:OmniLight3D = %OmniLight3D
@onready var gpu_particles_3d:Node3D = $GPUParticles3D

var _target_intensity:float

func _ready():
	_target_intensity = randf_range(0.3, 1.5)	
	
func _process(delta):
	omni_light_3d.light_energy = move_toward(omni_light_3d.light_energy, _target_intensity, 5.0 * delta)
	if is_equal_approx(omni_light_3d.light_energy, _target_intensity):
		_target_intensity = randf_range(0.3, 1.5) 
	gpu_particles_3d.global_rotation = Vector3.ZERO
