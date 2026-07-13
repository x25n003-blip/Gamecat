extends StaticBody2D

@export var disappear_delay: float = 0   # 乗ってから崩れるまでの猶予

var triggered := false

@onready var sprite: ColorRect = $ColorRect
@onready var collision: CollisionShape2D = $CollisionShape2D
@onready var detector: Area2D = $Area2D

func _ready() -> void:
	detector.body_entered.connect(_on_detector_body_entered)

func _on_detector_body_entered(body: Node2D) -> void:
	if triggered or not body.is_in_group("player"):
		return
	triggered = true
	await get_tree().create_timer(disappear_delay).timeout
	sprite.visible = false
	collision.set_deferred("disabled", true)
