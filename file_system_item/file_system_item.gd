extends Button
class_name FileSystemItem

signal document_dropped(at_position)

@export var file_size := 0.0


func _ready():
	mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	flat = true  # Makes the button background transparent
	clip_text = true
	vertical_icon_alignment = VERTICAL_ALIGNMENT_TOP
	alignment = HORIZONTAL_ALIGNMENT_CENTER


func _get_drag_data(_position):
	# Create a preview of the drag
	var preview = Button.new()
	preview.icon = self.icon
	preview.expand_icon = self.expand_icon
	preview.size = self.size
	preview.size = self.size
	preview.text = self.text
	preview.icon_alignment = self.icon_alignment
	preview.vertical_icon_alignment = self.vertical_icon_alignment
	preview.flat = true
	
	set_drag_preview(preview)
	
	# Return the data for the drop target to use
	return {
		"type": get_type(),
		"title": text,
		"original_position": global_position,
		"model": self
	}


func get_type() -> String:
	# This should be overridden by child classes
	return "file_system_item"
