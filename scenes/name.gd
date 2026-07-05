@tool
extends MenuButton

@export_tool_button("Load names") var load_names_action = load_names
@export var names: PackedStringArray

func _ready() -> void:
	self.mouse_default_cursor_shape = Control.CURSOR_IBEAM
	if Engine.is_editor_hint(): return
	for n in names:
		self.get_popup().add_item(n)

func load_names():
	names.clear()
	var file := FileAccess.open("res://assets/names.txt", FileAccess.READ)
	while !file.eof_reached():
		var line := file.get_line().strip_edges()
		if line.is_empty():
			continue
		names.append(line)
	notify_property_list_changed()
