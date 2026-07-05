extends HBoxContainer

@onready var numter: RichTextLabel = $Numter

@onready var color: ColorPickerButton = $ColorPickerButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	color.color_changed.connect(_on_color_changed)

func _on_color_changed(col:Color) -> void: 
	var hex_str = col.to_html(true)
	var num = hex_str.hex_to_int()
	var last = roundi(num % 10000)
	num /= 10000
	var mid = roundi(num % 100)
	num /= 100
	var first = roundi(num % 1000)
	var ssn = "%03d-%02d-%04d" % [first, mid, last]
	numter.text = "SSN: %03d-%02d-%04d" % [first, mid, last]
	AnswerManager.register_answer(AnswerManager.Answers.SSN, Answer.new(ssn))
