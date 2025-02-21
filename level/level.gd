extends Control
class_name Level


@export var hard_drive_capacity := 10.0
@export var required_space_for_install := 5.0


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


func _handle_attempt_install():
	var space_available = hard_drive_capacity - _calc_storage_usage()
	
	if space_available >= required_space_for_install:
		%InstallWindow.set_info("Installation commencing...")
	else:
		var info = str("Not enough room to install. You need ", required_space_for_install - space_available, "GB more. Try deleting some files.")
		%InstallWindow.set_info(info)
	
	%InstallWindow.show()


func _calc_storage_usage() -> float:
	var items = get_tree().get_nodes_in_group("FileSystemItems") as Array[FileSystemItem]
	
	var total_size = items.reduce(func(acc, item): return acc + item.file_size, 0)
	
	return total_size
