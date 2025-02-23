extends Control


@onready var fade_rect: ColorRect = $FadeRect
@onready var credits_container: VBoxContainer = $CreditsContainer


func start_credits() -> void:
	fade_rect.show()
	credits_container.show()
	
	var fade_tween = create_tween()
	fade_tween.tween_property(fade_rect, "modulate:a", 1.0, 2.0)
	
	var credits_tween = create_tween()
	credits_tween.tween_property(credits_container, "position:y", 
		-credits_container.size.y, 20.0)
	
	await credits_tween.finished
