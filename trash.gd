extends Button

@export_file() var hover_icon_file

signal document_dropped(data, drop_position)

var original_icon := icon
var contents: Array[Node]


func _can_drop_data(_position, data):
	# Check if the incoming drag data is a document
	return typeof(data) == TYPE_DICTIONARY and data.has("type") and data["type"] == "document"


func _drop_data(at_position, data):
	# Emit signal with the drop data and position
	print(data, at_position)
	document_dropped.emit(data, at_position)
	contents.append(data.model)
	data.model.hide()
	icon = original_icon


func _notification(what):
	var hover_icon = load(hover_icon_file)
	
	match what:
		NOTIFICATION_MOUSE_ENTER:
			# Handle mouse hover enter
			if %Screen.gui_is_dragging():
				icon = hover_icon
		NOTIFICATION_MOUSE_EXIT:
			# Handle mouse hover exit
			icon = original_icon


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
	preview.icon_alignment = self.icon_alignment
	preview.vertical_icon_alignment = self.vertical_icon_alignment
	preview.flat = true
		
	set_drag_preview(preview)
	
	# Return the data for the drop target to use
	return {
		"type": "trash",
		"title": text,
		"original_position": global_position,
		"model": self
	}
