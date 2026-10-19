extends Node3D

@onready var player_controller: CharacterBody3D = $".."

var input_rotation: Vector3
var mouse_input: Vector2

var is_watch_npc: bool
var npc_position: Vector3

func _ready() -> void:
	input_rotation.y = player_controller.rotation.y
	input_rotation.x = rotation.x
	
	
func _input(event: InputEvent) -> void:
	if GS.dialog_is_open:
		return
	
	if event is InputEventMouseMotion:
		var relative_movement = event.screen_relative
		
		# accumula il movimento del mouse per poi applicarlo al prossimo frame
		mouse_input.x += -relative_movement.x * (GS.mouse_sensitivity)
		mouse_input.y += -relative_movement.y * (GS.mouse_sensitivity)


func _process(_delta: float) -> void:
	input_rotation.x = clampf(input_rotation.x + mouse_input.y, deg_to_rad(-90), deg_to_rad(85))
	input_rotation.y += mouse_input.x
	
	# rotate camera controller (up/down)
	transform.basis = Basis.from_euler(Vector3(input_rotation.x, 0.0, 0.0))
	
	# applicata alla player per permettere di muoversi nella direzione giusta al movimento della camerta
	# rotate player (left/right)
	player_controller.global_transform.basis = Basis.from_euler(Vector3(0.0, input_rotation.y, 0.0))
	
	mouse_input = Vector2.ZERO
	

func watch_in_direction_of(npc_to_watch: String):
	print(npc_to_watch)
	var npcs = get_tree().get_nodes_in_group("npc")
	for npc in npcs:
		if npc.interact_identifier == npc_to_watch:
			var direction = player_controller.global_position.direction_to(npc.global_position)
			var target_rotation_y = atan2(-direction.x, -direction.z)

			var flat_distance = Vector2(direction.x, direction.z).length()
			var target_rotation_x = atan2(direction.y, flat_distance)

			input_rotation.y = target_rotation_y
			input_rotation.x = clampf(target_rotation_x, deg_to_rad(-90), deg_to_rad(85))
