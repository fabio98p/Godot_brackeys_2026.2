extends Node3D

@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var hud_main: Control = %HudMain

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#await get_tree().create_timer(1).timeout
	#get_tree().get_first_node_in_group("player").head.watch_in_direction_of("Ettore")
	#await get_tree().create_timer(1).timeout
	#get_tree().get_first_node_in_group("player").head.watch_in_direction_of("Karen")
