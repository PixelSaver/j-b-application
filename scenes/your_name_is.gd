extends Control
const ANS = AnswerManager.Answers
var first := "" :
	set(val):
		first = val
		_update_name()
var last := "" :
	set(val):
		last = val
		_update_name()

@onready var line_edit_first: LineEdit = $First/FirstName/LineEdit
@onready var line_edit_last: LineEdit = $Last/LastName/LineEdit
@onready var your_name_is: RichTextLabel = $HBoxContainer/YourNameIs

func _ready() -> void:
	line_edit_first.text_changed.connect(func(new_text:String): 
		first = new_text
		AnswerManager.register_answer(ANS.FIRST_NAME, Answer.new(first))
		)
	line_edit_last.text_changed.connect(func(new_text:String): 
		last = new_text
		AnswerManager.register_answer(ANS.LAST_NAME, Answer.new(last))
		)

func _update_name() -> void:
	your_name_is.text = "[color=gray]Your name is:[/color] %s %s" % [first, last]
	
