extends State
class_name LevelState

var level : Level


func enter(_msg := {}) -> void:
	level = state_machine.owner as Level
	GameEvents.request_empty_trash.connect(level._request_empty_trash)
	GameEvents.get_info.connect(level._get_info)
	GameEvents.item_clicked.connect(level._handle_item_clicked)
	GameEvents.desktop_clicked.connect(level._handle_desktop_clicked)
	GameEvents.file_added_to_trash.connect(level._handle_file_added_to_trash)
	GameEvents.files_deleted_from_trash.connect(level._handle_files_deleted_from_trash)
	GameEvents.attempt_install.connect(level._handle_attempt_install)


func exit() -> void:
	GameEvents.request_empty_trash.disconnect(level._request_empty_trash)
	GameEvents.get_info.disconnect(level._get_info)
	GameEvents.item_clicked.disconnect(level._handle_item_clicked)
	GameEvents.desktop_clicked.disconnect(level._handle_desktop_clicked)
	GameEvents.file_added_to_trash.disconnect(level._handle_file_added_to_trash)
	GameEvents.files_deleted_from_trash.disconnect(level._handle_files_deleted_from_trash)
	GameEvents.attempt_install.disconnect(level._handle_attempt_install)
