extends FileSystemItemState


func enter(_msg := {}) -> void:
	super.enter()
	print("enter asleep")
	file_system_item.mouse_entered.connect(_handle_mouse_entered)


func exit() -> void:
	print("exit asleep")
	file_system_item.mouse_entered.disconnect(_handle_mouse_entered)


func _handle_mouse_entered():
	if file_system_item.infected:
		state_machine.transition_to("Awake")
		print("eek")
		 # Calculate the direction vector from the cursor to the item
		var direction = (file_system_item.position - file_system_item.get_global_mouse_position()).normalized()
		# Move the item a small distance along the direction vector
		file_system_item.position += direction * 10  # Adjust the distance as needed
