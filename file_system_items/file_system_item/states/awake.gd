extends FileSystemItemState


func enter(_msg := {}) -> void:
	super.enter()
	print("enter awake")
	#file_system_item.mouse_entered.connect(_handle_mouse_entered)


func exit() -> void:
	print("exit awake")
	#file_system_item.mouse_entered.disconnect(_handle_mouse_entered)
	

# Virtual function. Corresponds to the `_process()` callback.
func update(_delta: float) -> void:
	pass


# Virtual function. Corresponds to the `_physics_process()` callback.
func physics_update(_delta: float) -> void:
	pass
