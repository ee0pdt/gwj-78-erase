extends Button


signal document_dropped(at_position)

func _ready():
	mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	flat = true  # Makes the button background transparent
	clip_text = true
	vertical_icon_alignment = VERTICAL_ALIGNMENT_TOP
	alignment = HORIZONTAL_ALIGNMENT_CENTER
	
func _get_drag_data(_position):
	# Create a preview of the drag
	var preview = Button.new()
	preview.icon = icon
	preview.size = self.size
	preview.text = self.text
	preview.flat = true
	
	set_drag_preview(preview)
	
	# Return the data for the drop target to use
	return {
		"type": "document",
		"title": text,
		"original_position": global_position,
		"model": self
	}
