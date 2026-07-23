extends CharacterBody2D

const SPEED = 200.0
const GRAVITY = 980.0

func _physics_process(delta):
	# 重力
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# 左右移動
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED

	move_and_slide()
