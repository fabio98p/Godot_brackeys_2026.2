extends Control

@onready var pause_menu: Panel = $PauseMenu

@onready var sensitivity_slider: HSlider = $PauseMenu/VBoxContainer/Sensitivity/SensitivitySlider

@onready var objective_label: Label = %ObjectiveLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sensitivity_slider.value = GS.mouse_sensitivity
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _process(delta: float) -> void:	
	if Story.current_story_interaction.objective_label != null:
		objective_label.text = Story.current_story_interaction.objective_label
	
		
	# Handle Pause Menu
	if Input.is_action_just_pressed("pause_menu"):

		if pause_menu.visible == false:
			toggle_pause_menu()
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			get_tree().paused = true
		else:
			toggle_pause_menu()
			get_tree().paused = false
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		if GS.dialog_is_open:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func toggle_pause_menu():
	if pause_menu.visible == true:
		pause_menu.visible = false
		print(get_tree().get_first_node_in_group("level").name)
		get_tree().get_first_node_in_group("level").canvas_layer.layer = 0
	else:
		pause_menu.visible = true
		get_tree().get_first_node_in_group("level").canvas_layer.layer = 1000

func _on_sensitivity_slider_drag_ended(value_changed: bool) -> void:
	GS.mouse_sensitivity = sensitivity_slider.value

func _on_return_to_game_button_pressed() -> void:
	toggle_pause_menu()
	get_tree().paused = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
