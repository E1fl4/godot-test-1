extends Node

@export var box_scene: PackedScene
@export var ball_scene: PackedScene

func _process(delta: float) -> void:
	# var ball = ball_scene.instantiate()
	# ball.translate(Vector3(0, 50, 0))
	# add_child(ball)
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("e"):
		var ball = ball_scene.instantiate()
		ball.translate(Vector3(0, 60, 0))
		add_child(ball)
	elif event is InputEventKey && event.keycode == KEY_R:
		var box = box_scene.instantiate()
		box.translate(Vector3(0, 50, 0))
		add_child(box)
