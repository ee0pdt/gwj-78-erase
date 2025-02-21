class_name Document
extends FileSystemItem


@export_multiline var file_contents = ""


func get_type() -> String:
	return "document"


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		var mouse_event = event as InputEventMouseButton
		if mouse_event.button_index == MOUSE_BUTTON_LEFT and mouse_event.double_click:
			%RichTextLabel.text = file_contents
			%Window.show()


func _handle_close() -> void:
	%Window.hide()
