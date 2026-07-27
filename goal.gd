extends Area2D

# インスペクターから次のステージのシーンファイルを指定できるようにする
@export_file("*.tscn") var next_stage_scene: String

func _ready() -> void:
	# プレイヤーがエリアに入ったときのイベント（シグナル）を接続
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	# 衝突したのがプレイヤーグループの場合（プレイヤー側に "player" グループを設定しておく）
	if body.is_in_group("player"):
		call_deferred("_change_scene")

func _change_scene() -> void:
	if next_stage_scene != "":
		# 次のステージへ切り替え
		get_tree().change_scene_to_file(next_stage_scene)
	else:
		print("次のステージが設定されていません！")

