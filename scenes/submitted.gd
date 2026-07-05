extends PixelMenu
class_name SubmittedScreen
@onready var default_button: DefaultButton = $MarginContainer/VBoxContainer/HBoxContainer/DefaultButton

func _ready() -> void:
	default_button.pressed.connect(func():
		Global.menu_manager.transition_to_scene(SceneDatabase.get_scene(SceneDatabase.Scene.APPLICATION))
	)

func start_anim() -> void: pass
func end_anim() -> void: queue_free()
