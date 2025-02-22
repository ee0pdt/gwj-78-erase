extends LevelState


func enter(_msg := {}) -> void:
	level = state_machine.owner as Level


func exit() -> void:
	pass
