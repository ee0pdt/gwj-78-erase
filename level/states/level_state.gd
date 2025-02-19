extends State
class_name LevelState

var level

func enter(_msg := {}) -> void:
	level = state_machine.owner as Level
	GameEvents.empty_trash.connect(level._empty_trash)
	GameEvents.get_info.connect(level._get_info)

func exit() -> void:
	GameEvents.empty_trash.disconnect(level._empty_trash)
	GameEvents.get_info.disconnect(level._get_info)
