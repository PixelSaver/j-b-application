extends HBoxContainer

@onready var color: ColorPickerButton = $ColorPickerButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	color.color_changed.connect(_on_color_changed)

func _on_color_changed() -> void: pass
