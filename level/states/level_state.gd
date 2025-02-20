extends State
class_name LevelState

var level : Level

func enter(_msg := {}) -> void:
	level = state_machine.owner as Level
	GameEvents.request_empty_trash.connect(level._request_empty_trash)
	GameEvents.get_info.connect(level._get_info)

func exit() -> void:
	GameEvents.request_empty_trash.disconnect(level._request_empty_trash)
	GameEvents.get_info.disconnect(level._get_info)
