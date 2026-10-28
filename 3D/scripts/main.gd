extends Node

@export var box_scene: PackedScene
@export var ball_scene: PackedScene

func _process(delta: float) -> void:
	# var ball = ball_scene.instantiate()
	# ball.translate(Vector3(0, 50, 0))
	# add_child(ball)
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.keycode == KEY_E:
			var ball = ball_scene.instantiate()
			ball.translate(Vector3(0, 50, 0))
			add_child(ball)
