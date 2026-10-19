extends RayCast3D

@onready var label: Label = $Label

func _ready() -> void:
	label.text= ""
	
func _process(delta: float) -> void:
	if GS.dialog_is_open:
		return
	
	if is_colliding():
		var collider = get_collider()
		if collider is Interactible:
			label.text = collider.int_name
			if Input.is_action_just_pressed("interaction"):
				if collider is StoryInteractible:
					Story.manage_story_interaction(collider.interact_identifier)
				else:
					collider.interact.emit()

	else:
		label.text = ""
