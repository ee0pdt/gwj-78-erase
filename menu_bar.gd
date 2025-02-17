extends MenuBar


func _on_special_menu_id_pressed(id: int) -> void:
	match id:
		0:
			%EmptyTrashDialog.show()
