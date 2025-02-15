extends Node


# In your main scene
func _ready():
	# Set up the panel (drop target)
	%Desktop.document_dropped.connect(_on_document_dropped)
	%Trash.pressed.connect(_on_document_clicked)

func _on_document_clicked():
	print("Document clicked!")

func _on_document_dropped(data, drop_position):
	# Handle the drop - e.g., move the document to the new position
	var doc_node = data.model
	if doc_node:
		doc_node.global_position = drop_position
