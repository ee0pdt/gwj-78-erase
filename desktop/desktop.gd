extends Panel


signal document_dropped(data, drop_position)


# In your main scene
func _ready():
	# Set up the panel (drop target)
	self.document_dropped.connect(_on_document_dropped)
	#%Trash.pressed.connect(_on_document_clicked)


func _can_drop_data(_position, data):
	print("_can_drop_data", data)
	# Check if the incoming drag data is a document
	return typeof(data) == TYPE_DICTIONARY and data.has("type")


func _drop_data(at_position, data):
	# Emit signal with the drop data and position
	document_dropped.emit(data, at_position)


func _on_document_dropped(data, drop_position):
	print("_on_document_dropped")
	# Handle the drop - e.g., move the document to the new position
	var doc_node = data.model
	if doc_node:
		doc_node.global_position = drop_position


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		print("desktop clicked")
		GameEvents.desktop_clicked.emit()
