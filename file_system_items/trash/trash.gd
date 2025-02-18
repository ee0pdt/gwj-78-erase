extends FileSystemItem

@export_file() var hover_icon_file
@export_node_path() var screen

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
	
	var total_size = contents.reduce(func(acc, item): return acc + item.file_size, 0)
	print(total_size)


func _notification(what):
	var hover_icon = load(hover_icon_file)
	
	match what:
		NOTIFICATION_MOUSE_ENTER:
			# Handle mouse hover enter
			if screen and screen.gui_is_dragging():
				icon = hover_icon
		NOTIFICATION_MOUSE_EXIT:
			# Handle mouse hover exit
			icon = original_icon


func get_type() -> String:
	return "trash"
