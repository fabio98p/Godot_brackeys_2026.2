extends Node3D
@onready var sprite_3d: Sprite3D = $Sprite3D

var player: player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_tree().get_nodes_in_group("player")[0]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
