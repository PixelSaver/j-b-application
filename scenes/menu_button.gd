extends MenuButton

@export var _text: RichTextLabel
@export var id: AnswerManager.Answers

func _ready() -> void:
	self.get_popup().id_pressed.connect(_id_pressed)

func _id_pressed(_id:int) -> void:
	var _str = get_popup().get_item_text(_id)
	_text.text = _str
	AnswerManager.register_answer(id, Answer.new(_str))
