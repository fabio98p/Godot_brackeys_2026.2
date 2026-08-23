extends Node

var current_story_interaction: StoryInteractionResource

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_story_interaction = preload("uid://c4dpsbltexo8p")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func manage_story_interaction(interacted_by: String):
	if interacted_by == current_story_interaction.need_intercated_by:
		if current_story_interaction.is_dialogue_interaction:
			DialogueManager.show_dialogue_balloon(current_story_interaction.dialog_interaction)
			if current_story_interaction.next_interaction:
				current_story_interaction = current_story_interaction.next_interaction
	
