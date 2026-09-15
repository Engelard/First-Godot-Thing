extends Area2D

@onready var game_manager: Node = %GameManager
@onready var pick_up_sound: AudioStreamPlayer = $PickUpSound
@onready var animation_consumed: AnimationPlayer = $"Animation-Consumed"


func _on_body_entered(body: Node2D) -> void:
	game_manager.add_coin()
	
	animation_consumed.play("new_animation")
	pick_up_sound.play()
	
