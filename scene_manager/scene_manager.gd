extends Control

@export_file() var OS1
@export var fade_duration: float = 5.0  # Duration of crossfade in seconds


var current_scene: Node


func _ready() -> void:
	%SoundStartup.play()
	await get_tree().create_timer(2.0).timeout
	%LoadingOS.show()
	await get_tree().create_timer(5.0).timeout
	%MusicOS3.play()
	%LoadingOS.hide()
	%OS3.show()
	GameEvents.downgrade.connect(self._handle_downgrade)
	GameEvents.restart.connect(self._handle_restart)
	current_scene = %OS3


func _handle_restart() -> void:
	var scene_path = current_scene.scene_file_path 

	current_scene.queue_free()

	await current_scene.tree_exited

	var scene = load(scene_path)
	var new_instance = scene.instantiate()

	add_child(new_instance)
	
	current_scene = new_instance


func _handle_downgrade() -> void:
	var OS1_scene = load(OS1).instantiate()
	
	
	# Start new music at 0 volume
	%MusicOS1.volume_db = -80
	%MusicOS1.play()
	
	await get_tree().create_timer(5.0).timeout
	
	%OS1Loading.show()
	%OS3.queue_free()
	
	await get_tree().create_timer(2.0).timeout
	
	# Create crossfade
	var tween = create_tween()
	# Fade out OS3 music
	tween.parallel().tween_property(%MusicOS3, "volume_db", -80, fade_duration)
	# Fade in OS1 music
	tween.parallel().tween_property(%MusicOS1, "volume_db", 0, fade_duration)
	
	# Stop OS3 music after fade completes
	await tween.finished
	%MusicOS3.stop()
	
	
	add_child(OS1_scene)
	%OS1Loading.hide()
	
	current_scene = OS1_scene
