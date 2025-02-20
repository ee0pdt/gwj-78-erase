extends FileSystemItem

@export_file() var hover_icon_file
@export_file() var full_icon_file
@export_file() var full_hover_icon_file
@export_node_path() var screen

var original_icon := icon
var hover_icon := icon
var full_icon := icon
var full_hover_icon := icon
var screen_node: Window

var contents: Array[FileSystemItem]


func _ready() -> void:
	hover_icon = load(hover_icon_file) if hover_icon_file else original_icon
	full_icon = load(full_icon_file) if full_icon_file else original_icon
	full_hover_icon = load(full_hover_icon_file) if full_hover_icon_file else original_icon
	screen_node = get_node(screen)
	GameEvents.empty_trash.connect(self._empty)


func _empty():
	GameEvents.files_deleted_from_trash.emit(contents)
	contents = []
	print("I'm empty!")
	icon = original_icon


func _is_full() -> bool:
	return contents.size() > 0


func _can_drop_data(_position, data):
	# Check if the incoming drag data is a document
	return typeof(data) == TYPE_DICTIONARY and data.has("type") and (data["type"] == "document" || data["type"] == "application")


func _drop_data(at_position, data):
	# Emit signal with the drop data and position
	print(data, at_position)
	document_dropped.emit(data, at_position)
	contents.append(data.model)
	data.model.hide()
	icon = full_icon if _is_full() else original_icon
	
	var total_size = contents.reduce(func(acc, item): return acc + item.file_size, 0)
	print(total_size)
	GameEvents.file_added_to_trash.emit(data.model)


func _notification(what):
	match what:
		NOTIFICATION_MOUSE_ENTER:
			# Handle mouse hover enter
			if screen_node and screen_node.gui_is_dragging():
				icon = full_hover_icon if _is_full() else hover_icon
		NOTIFICATION_MOUSE_EXIT:
			# Handle mouse hover exit
			icon = full_icon if _is_full() else original_icon


func get_type() -> String:
	return "trash"
