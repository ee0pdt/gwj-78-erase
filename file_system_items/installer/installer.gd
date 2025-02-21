extends Application
class_name Installer


func get_type() -> String:
	return "application"


func _handle_mouseup() -> void:
	print("installer clicked")
	GameEvents.item_clicked.emit(self)


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		var mouse_event = event as InputEventMouseButton
		if mouse_event.button_index == MOUSE_BUTTON_LEFT and mouse_event.double_click:
			# Handle double click here
			print("Double click detected!")
			GameEvents.attempt_install.emit()
