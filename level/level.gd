extends Control
class_name Level


var currently_selected_item: FileSystemItem = null


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _request_empty_trash() -> void:
	%EmptyTrashDialog.show()


func _confirm_empty_trash() -> void:
	print("empty trash confirmed")
	%EmptyTrashDialog.hide()
	GameEvents.empty_trash.emit()
	%SoundEmptyTrash.play()


func _cancel_empty_trash() -> void:
	%EmptyTrashDialog.hide()


func _get_info() -> void:
	if !currently_selected_item:
		return
	
	print("Getting info")
	
	%InfoWindow.set_info(currently_selected_item)
	%InfoWindow.show()


func _handle_close_info():
	%InfoWindow.hide()


func _handle_item_clicked(item: FileSystemItem):
	print("_handle_item_clicked")
	currently_selected_item = item
	%MenuBar.enable_file_info()


func _handle_desktop_clicked():
	print("_handle_desktop_clicked")
	
	if !currently_selected_item:
		return
	
	currently_selected_item.release_focus()
	%MenuBar.disable_file_info()
	currently_selected_item = null


func _handle_files_deleted_from_trash(files: Array[FileSystemItem]):
	%MenuBar.disable_empty_trash()


func _handle_file_added_to_trash(file: FileSystemItem):
	%MenuBar.enable_empty_trash()
	%SoundItemAddedToTrash.play()
