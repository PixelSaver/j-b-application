extends MenuButton

@export var _text: RichTextLabel

func _ready() -> void:
	self.get_popup().id_pressed.connect(_id_pressed)

func _id_pressed(id:int) -> void:
	var str = get_popup().get_item_text(id)
	_text.text = str
