extends CharacterBody3D


const SPEED = 5
const JUMP_VELOCITY = 6


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * 1.5 * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if Input.is_action_just_pressed("fyoom"):
		velocity = transform.basis * Vector3(0, 0, -1) * 80
	if Input.is_action_pressed("shift"):
		velocity.x *= 0.85
		velocity.y -= 10
		velocity.z *= 0.85
	elif Input.is_action_pressed("tab"):
		velocity.y += 3
	if direction:
		# velocity.x = direction.x * SPEED
		# velocity.z = direction.z * SPEED
		velocity.x = move_toward(velocity.x, direction.x * SPEED, 1.5)
		velocity.z = move_toward(velocity.z, direction.z * SPEED, 1.5)
	else:
		velocity.x = move_toward(velocity.x, 0, 0.5)
		velocity.z = move_toward(velocity.z, 0, 0.5)

	move_and_slide()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * 0.01)
		$Camera3D.rotate_x(-event.relative.y * 0.01)
		$Camera3D.rotation.x = clampf($Camera3D.rotation.x, -deg_to_rad(89), deg_to_rad(89))


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body == self:
		position.y = 150
