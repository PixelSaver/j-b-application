extends Resource
class_name Answer

#@export var id : AnswerManager.Answers
@export var name: String
@export var value: Variant

func _init(_value:Variant) -> void:
	#id = _id
	#name = _name
	value = _value
