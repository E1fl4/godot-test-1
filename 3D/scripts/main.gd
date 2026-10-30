extends Node

@export var box_scene: PackedScene
@export var ball_scene: PackedScene

func _process(delta: float) -> void:
	# var ball = ball_scene.instantiate()
	# ball.translate(Vector3(0, 50, 0))
	# add_child(ball)
	if Input.is_action_pressed("r"):
		for i in range(10):
			var box = box_scene.instantiate()
			box.translate(Vector3(0, 70, 0))
			add_child(box)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("e"):
		var ball = ball_scene.instantiate()
		ball.translate(Vector3(0, 80, 0))
		add_child(ball)
