extends PanelContainer

signal document_dropped(data, drop_position)

func _can_drop_data(_position, data):
	# Check if the incoming drag data is a document
	return typeof(data) == TYPE_DICTIONARY and data.has("type") and data["type"] == "document"

func _drop_data(at_position, data):
	# Emit signal with the drop data and position
	print(data, at_position)
	document_dropped.emit(data, at_position)
