extends Node3D

@onready var cpu_particles_3d: CPUParticles3D = $CPUParticles3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	while true:
		cpu_particles_3d.emitting = true
		await get_tree().create_timer(0.15).timeout
		cpu_particles_3d.emitting = false
		await get_tree().create_timer(3).timeout
