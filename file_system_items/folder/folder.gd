class_name Folder
extends FileSystemItem


@export var password : String


func _ready() -> void:
	%Window.title = text


func get_type() -> String:
	return "folder"


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		var mouse_event = event as InputEventMouseButton
		if mouse_event.button_index == MOUSE_BUTTON_LEFT and mouse_event.double_click:
			%Window.show()


func _handle_close() -> void:
	%Window.hide()
