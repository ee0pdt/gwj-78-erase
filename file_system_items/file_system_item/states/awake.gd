extends FileSystemItemState

var direction = Vector2.ZERO
var steps_remaining = 0

func enter(_msg := {}) -> void:
	super.enter()
	print("enter awake")
	#file_system_item.mouse_entered.connect(_handle_mouse_entered)


func exit() -> void:
	print("exit awake")
	#file_system_item.mouse_entered.disconnect(_handle_mouse_entered)
	

# Virtual function. Corresponds to the `_process()` callback.
func update(_delta: float) -> void:
	if steps_remaining <= 0:
		direction = Vector2(randi() % 10 - 5, randi() % 10 - 5).normalized()
		steps_remaining = randi() % 20 + 10
	var new_position = file_system_item.position + direction * 5
	var window_size = get_viewport().size
	new_position.x = clamp(new_position.x, 0, window_size.x - file_system_item.size.x)
	new_position.y = clamp(new_position.y, 0, window_size.y - file_system_item.size.y)
	file_system_item.position = new_position
	steps_remaining -= 1


# Virtual function. Corresponds to the `_physics_process()` callback.
func physics_update(_delta: float) -> void:
	pass
