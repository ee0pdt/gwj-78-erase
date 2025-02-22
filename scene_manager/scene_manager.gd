extends Control

@export_file() var OS1
@export var fade_duration: float = 2.0  # Duration of crossfade in seconds

func _ready() -> void:
	%MusicOS3.play()
	GameEvents.downgrade.connect(self._handle_downgrade)

func _handle_downgrade() -> void:
	var OS1_scene = load(OS1).instantiate()
	
	
	# Start new music at 0 volume
	%MusicOS1.volume_db = -80
	%MusicOS1.play()
	
	# Create crossfade
	var tween = create_tween()
	# Fade out OS3 music
	tween.parallel().tween_property(%MusicOS3, "volume_db", -80, fade_duration)
	# Fade in OS1 music
	tween.parallel().tween_property(%MusicOS1, "volume_db", 0, fade_duration)
	
	# Stop OS3 music after fade completes
	await tween.finished
	%MusicOS3.stop()
	%OS3.queue_free()
	add_child(OS1_scene)
