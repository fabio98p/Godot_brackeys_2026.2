extends Node3D

@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var hud_main: Control = %HudMain

@export var Story_point: StoryInteractionResource
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Story.current_story_interaction = Story_point
	hud_main.transition_to_white()
	pass
	#await get_tree().create_timer(1).timeout
	#get_tree().get_first_node_in_group("player").head.watch_in_direction_of("Ettore")
	#await get_tree().create_timer(1).timeout
	#get_tree().get_first_node_in_group("player").head.watch_in_direction_of("Karen")

func start_animation(animation_string: String):
	animation_player.play(animation_string)
	
