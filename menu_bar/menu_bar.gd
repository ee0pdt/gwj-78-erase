extends MenuBar
class_name OSMenu

@export var trash : Node


#func _process(delta: float) -> void:
	#if trash and trash._is_full():
		#%SpecialMenu.set_item_disabled(0, false)
	#else:
		#%SpecialMenu.set_item_disabled(0, true)


func _on_special_menu_id_pressed(id: int) -> void:
	match id:
		0:
			GameEvents.request_empty_trash.emit()


func _on_file_menu_id_pressed(id: int) -> void:
	match id:
		0:
			GameEvents.get_info.emit()


func enable_file_info() -> void:
	%FileMenu.set_item_disabled(0, false)


func disable_file_info() -> void:
	%FileMenu.set_item_disabled(0, true)


func enable_empty_trash() -> void:
	%SpecialMenu.set_item_disabled(0, false)


func disable_empty_trash() -> void:
	%SpecialMenu.set_item_disabled(0, true)
