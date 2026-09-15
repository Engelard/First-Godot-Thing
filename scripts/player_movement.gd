extends CharacterBody2D


const SPEED = 100
const JUMP_VELOCITY = -250.0
@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		anim_sprite.play("Jump")

	# Handle jump.
	if Input.is_action_just_pressed("JUMP") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("MOVE LEFT", "MOVE RIGHT")
	if direction:
		velocity.x = direction * SPEED
		anim_sprite.play("Running")
		
		if direction > 0:
			anim_sprite.flip_h = false
		else:
			anim_sprite.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		anim_sprite.play("IDLE")

	move_and_slide()
