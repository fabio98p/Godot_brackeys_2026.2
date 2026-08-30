extends Control

@onready var pause_menu: Panel = $PauseMenu

@onready var sensitivity_slider: HSlider = $PauseMenu/VBoxContainer/Sensitivity/SensitivitySlider

@onready var objective_label: Label = %ObjectiveLabel

@onready var transition: Panel = $Transition

@onready var light_turn_off: Panel = $light_turn_off

@onready var volume_slider: HSlider = $PauseMenu/VBoxContainer/Volume/VolumeSlider
var master_bus_index := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sensitivity_slider.value = GS.mouse_sensitivity
	
	master_bus_index = AudioServer.get_bus_index("Master")
	# Set initial value with actual value using linear
	volume_slider.value = db_to_linear(AudioServer.get_bus_volume_db(master_bus_index)) * 100.0
	volume_slider.connect("value_changed", Callable(self, "_on_master_volume_changed"))

func _on_master_volume_changed(value: float) -> void:
	var db = linear_to_db(value / 100.0)
	AudioServer.set_bus_volume_db(master_bus_index, db)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if pause_menu.visible == false:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		
	if event.is_action_pressed("pause_menu"):
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

func _process(delta: float) -> void:
	if Story.current_story_interaction.objective_label != null:
		objective_label.text = Story.current_story_interaction.objective_label

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










func transition_to_black():
	var tween = create_tween()
	tween.tween_property(transition, "modulate:a", 1, 1.5)
	
func transition_to_white():
	var tween = create_tween()
	tween.tween_property(transition, "modulate:a", 0, 1.5)

func light_to_black():
	#get_parent().layer = 0
	var tween = create_tween()
	tween.tween_property(light_turn_off, "modulate:a", 1, 0.5)
