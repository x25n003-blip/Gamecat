extends CharacterBody2D

const SPEED = 200.0
const GRAVITY = 980.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta):

	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# ジャンプ
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# 左右移動
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED
	if global_position.y > 1000:
		#get_tree().reload_current_scene()
		pass
	move_and_slide()

	print(global_position.y)
	
