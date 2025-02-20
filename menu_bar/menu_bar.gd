extends MenuBar

@export var trash : Node


func _process(delta: float) -> void:
	if trash and trash._is_full():
		%SpecialMenu.set_item_disabled(0, false)
	else:
		%SpecialMenu.set_item_disabled(0, true)


func _on_special_menu_id_pressed(id: int) -> void:
	match id:
		0:
			GameEvents.request_empty_trash.emit()


func _on_file_menu_id_pressed(id: int) -> void:
	match id:
		0:
			GameEvents.get_info.emit()
