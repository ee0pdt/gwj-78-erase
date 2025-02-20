extends State
class_name FileSystemItemState

var file_system_item : FileSystemItem


func enter(_msg := {}) -> void:
	file_system_item = state_machine.owner as FileSystemItem
	
	
func exit() -> void:
	pass
