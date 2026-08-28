extends Node

var current_story_interaction: StoryInteractionResource = preload("uid://7wa46nqruyb4")

func watch_to_npc(npc: String):
	print("AAAA")
	get_tree().get_first_node_in_group("player").head.watch_in_direction_of(npc)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.connect("dialogue_started", Callable(self, "dialogue_started"))
	DialogueManager.connect("dialogue_ended", Callable(self, "dialogue_ended"))


func manage_story_interaction(interacted_by: String):
	print(interacted_by, current_story_interaction.need_intercated_by)
	if interacted_by == current_story_interaction.need_intercated_by:
		if current_story_interaction.is_dialogue_interaction:
			DialogueManager.show_dialogue_balloon(current_story_interaction.dialog_interaction)
			if current_story_interaction.next_interaction:
				current_story_interaction = current_story_interaction.next_interaction
	else:
		manage_normal_interaction(interacted_by)

func manage_normal_interaction(interacted_by: String):
	if interacted_by == "Karen":
		DialogueManager.show_dialogue_balloon(current_story_interaction.karen_dialog_interaction)
	if interacted_by == "Ettore":
		DialogueManager.show_dialogue_balloon(current_story_interaction.ettore_dialog_interaction)
	if interacted_by == "Wednesday":
		DialogueManager.show_dialogue_balloon(current_story_interaction.wednesday_dialog_interaction)
	if interacted_by == "Mohamed_Alibaba":
		DialogueManager.show_dialogue_balloon(current_story_interaction.mohamed_alibaba_dialog_interaction)
	if interacted_by == "Jonny_Bravo":
		DialogueManager.show_dialogue_balloon(current_story_interaction.jonny_bravo_dialog_interaction)


func dialogue_started(resource: DialogueResource):
	print("dialog:start")
	GS.dialog_is_open = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
func dialogue_ended(resource: DialogueResource):
	print("dialog:end")
	GS.dialog_is_open = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
