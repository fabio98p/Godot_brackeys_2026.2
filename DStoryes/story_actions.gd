@tool
extends Resource
class_name	StoryInteractionResource

@export var objective_label: String

# AROUD INTERATION dialogue
@export var ettore_dialog_interaction: DialogueResource
@export var wednesday_dialog_interaction: DialogueResource
@export var mohamed_alibaba_dialog_interaction: DialogueResource
@export var jonny_bravo_dialog_interaction: DialogueResource
@export var karen_dialog_interaction: DialogueResource

# For keep going with the story
@export var need_intercated_by: String
@export var next_interaction: StoryInteractionResource


@export var is_dialogue_interaction: bool = false:
	set(value):
		is_dialogue_interaction = value
		notify_property_list_changed()		
var dialog_interaction: DialogueResource	


func _get_property_list() -> Array:
	var properties = []
	
	if is_dialogue_interaction:
		properties.append({
			"name": "dialog_interaction",
			"type": TYPE_OBJECT,
			"hint": PROPERTY_HINT_RESOURCE_TYPE,
			"hint_string": "DialogueResource",
			"usage": PROPERTY_USAGE_DEFAULT
		})
		
	return properties
