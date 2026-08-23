extends Node

var current_story_interaction: StoryInteractionResource

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.connect("dialogue_started", Callable(self, "dialogue_started"))
	DialogueManager.connect("dialogue_ended", Callable(self, "dialogue_ended"))
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
	
func dialogue_started(resource: DialogueResource):
	print("dialog:start")
	GS.dialog_is_open = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
func dialogue_ended(resource: DialogueResource):
	print("dialog:end")
	GS.dialog_is_open = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
