extends PixelMenu
class_name Application

var t: Tween

func _ready() -> void:
	self.offset_transform_enabled = true
func start_anim() -> void: 
	if t and t.is_running(): t.kill()
	t = default_tween()
	self.offset_transform_position_ratio = Vector2(0, 1)
	t.tween_property(self, "offset_transform_position_ratio", Vector2.ZERO, 1.2)
func end_anim() -> void: 
	queue_free()
