extends MenuBar


func _on_special_menu_id_pressed(id: int) -> void:
	match id:
		0:
			GameEvents.empty_trash.emit()


func _on_file_menu_id_pressed(id: int) -> void:
	match id:
		0:
			GameEvents.get_info.emit()
