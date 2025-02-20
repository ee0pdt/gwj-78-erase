extends Node2D
class_name Level

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
	print("Getting info")
