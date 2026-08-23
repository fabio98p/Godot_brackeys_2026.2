extends Node3D

@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var hud_main: Control = %HudMain

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
