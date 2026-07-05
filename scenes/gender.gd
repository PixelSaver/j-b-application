extends VBoxContainer

@onready var male_text: RichTextLabel = $Male/Numter
@onready var male_slider: HSlider = $Male/MarginContainer/HSlider
@onready var female_text: RichTextLabel = $Female/Numter
@onready var female_slider: HSlider = $Female/MarginContainer/HSlider

func _ready() -> void:
	male_slider.value_changed.connect(_update_male)
	female_slider.value_changed.connect(_update_female)

func _update_male(val:float) -> void:
	male_text.text = "Male: %.1f%%" % val
	male_text.modulate = lerp(Color.WHITE, Color.BLUE, log(val)/log(100.))
	AnswerManager.register_answer(AnswerManager.Answers.GENDER_MALE, Answer.new(val))
func _update_female(val:float) -> void:
	female_text.text = "Female: %.1f%%" % val
	female_text.modulate = lerp(Color.WHITE, Color.HOT_PINK, log(val)/log(100.))
	AnswerManager.register_answer(AnswerManager.Answers.GENDER_FEMALE, Answer.new(val))
