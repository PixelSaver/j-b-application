#@tool
extends MenuButton

#@export_tool_button("Load Names") var load_names_action = load_names
@export var names: PackedStringArray
@onready var line_edit: LineEdit = $LineEdit

func _ready() -> void:
	self.mouse_default_cursor_shape = Control.CURSOR_IBEAM
	#if Engine.is_editor_hint(): return
	for n in names:
		self.get_popup().add_item(n)
	get_popup().id_pressed.connect(_on_id_pressed)

func _on_id_pressed(id:int) -> void:
	var n := get_popup().get_item_text(id)
	line_edit.text = n
	line_edit.text_changed.emit(n)

#func load_names():
	#names.clear()
	#var file := FileAccess.open("res://assets/last_names.txt", FileAccess.READ)
	#while !file.eof_reached():
		#var line := file.get_line().strip_edges()
		#if line.is_empty():
			#continue
		#names.append(line.capitalize())
	#notify_property_list_changed()
