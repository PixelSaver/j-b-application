extends HBoxContainer

const ANS = AnswerManager.Answers
@onready var h_slider: HSlider = $MarginContainer/HSlider
@onready var numter: RichTextLabel = $Numter

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	h_slider.value_changed.connect(_update_phone_number)

func _update_phone_number(val:float) -> void:
	var num = int(val)
	var last = str(num % 10000).pad_zeros(4)
	num /= 10000
	var mid = str(num % 1000).pad_zeros(3)
	num /= 1000
	var first = str(num % 1000).pad_zeros(3)
	num /= 1000
	var country = num
	var number = "+%s (%s) %s-%s" %[country, first, mid, last]
	numter.text = "Phone #: %s" % number
	AnswerManager.register_answer(ANS.PHONE_NUMBER, Answer.new(number))
