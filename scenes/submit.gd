extends VBoxContainer

@export var submit_button: DefaultButton
@export var error_text: RichTextLabel

func _ready() -> void:
	submit_button.pressed.connect(_on_submit)

func _on_submit() -> void: 
	var missing := AnswerManager.get_unfulfilled_questions()
	var str_missing = ""
	if missing.size() == 0:
		Global.menu_manager.transition_to_scene(SceneDatabase.get_scene(SceneDatabase.Scene.SUBMITTED))
		# win
	for i in range(missing.size()):
		var id = missing[i]
		var answer = AnswerManager.get_answer_name(id)
		str_missing += answer
		if i != missing.size() - 1:
			str_missing += (", ")
	
	error_text.text = "[color=red]There are still questions missing answers. Please give answers to the following questions: %s" % str_missing
