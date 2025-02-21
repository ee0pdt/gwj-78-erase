extends Node


# Installation Events
signal attempt_install  # Installation window triggers this
signal attempt_downgrade

# File System Events
signal file_added_to_trash(file: FileSystemItem)
signal file_removed_from_trash(file: FileSystemItem)
signal request_empty_trash
signal empty_trash
signal files_deleted_from_trash(files: Array[FileSystemItem])
#signal system_file_deleted(file: Node)

# Virus Events
#signal virus_cloned(original: Node, clone: Node)
#signal file_infected(file: Node)
#signal virus_multiplied()

# System Events
signal system_crash(reason: String)
#signal system_restored()

# File Interaction Events
signal item_clicked(file: FileSystemItem)
signal get_info
signal desktop_clicked
#signal file_drag_started(file: Node)
#signal file_drag_ended(file: Node)
#signal file_hover_started(file: Node)
#signal file_hover_ended(file: Node)

# Helper Functions
static func format_bytes(bytes: int) -> String:
	const BYTES_PER_KB = 1024
	const BYTES_PER_MB = BYTES_PER_KB * 1024
	
	if bytes < BYTES_PER_KB:
		return str(bytes) + " B"
	elif bytes < BYTES_PER_MB:
		return str(bytes / BYTES_PER_KB) + " KB"
	else:
		return str(bytes / BYTES_PER_MB) + " MB"
