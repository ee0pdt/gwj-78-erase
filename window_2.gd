extends Window

@onready var parent_panel = get_parent()  # Ensure the parent is correctly set

func _process(delta):
	if parent_panel and parent_panel is Panel:
		var parent_rect = Rect2(parent_panel.position, parent_panel.size)
		var new_position = position

		# Clamp position to keep it inside the parent's boundaries
		new_position.x = clamp(new_position.x, parent_rect.position.x, parent_rect.end.x - size.x)
		new_position.y = clamp(new_position.y, parent_rect.position.y, parent_rect.end.y - size.y)

		position = new_position
