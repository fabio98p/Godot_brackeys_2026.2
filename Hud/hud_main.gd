extends Control

@onready var pause_menu: Panel = $PauseMenu

@onready var sensitivity_slider: HSlider = $PauseMenu/VBoxContainer/Sensitivity/SensitivitySlider

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sensitivity_slider.value = GS.mouse_sensitivity

func _process(delta: float) -> void:
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
	print(GS.mouse_sensitivity, sensitivity_slider.value)

func toggle_pause_menu():
	print("heerree")
	if pause_menu.visible == true:
		pause_menu.visible = false
	else:
		pause_menu.visible = true


func _on_sensitivity_slider_drag_ended(value_changed: bool) -> void:
	GS.mouse_sensitivity = sensitivity_slider.value
