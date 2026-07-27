extends Node

var lives: int = 3
var checkpoint_position: Vector2 = Vector2(80, 300)
var broken_blocks: Array[String] = []

func set_checkpoint(pos: Vector2, current_broken: Array[String]) -> void:
	checkpoint_position = pos
	broken_blocks = current_broken.duplicate()

func player_died() -> void:
	lives -= 1
	if lives < 0:
		lives = 3
	get_tree().reload_current_scene()

func reset() -> void:
	lives = 3
	checkpoint_position = Vector2(80, 300)
	broken_blocks.clear()
