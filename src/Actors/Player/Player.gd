extends Actor

export var stomp_impulse : = 1000.0
export (PackedScene) var Bullet

func _on_EnemyDetector_area_entered(area: Area2D) -> void:
	_velocity = calculate_stomp_velocity(_velocity, stomp_impulse)

func _on_EnemyDetector_body_entered(body: Node) -> void:
	get_tree().change_scene("res://src/Levels/Testing_SCIFI.tscn")

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()
	var direction = get_direction() 
	_velocity = calculate_move_velocity(_velocity, direction, speed) 
	look_at(get_global_mouse_position())
	_velocity = move_and_slide(_velocity)

func get_direction() -> Vector2:
	var xpow: = 0
	var ypow: = 0
	if Input.get_action_strength("move_left"):
		xpow -= 1
	if Input.get_action_strength("move_right"):
		xpow -= -1
	if Input.get_action_strength("jump"):
		ypow -= 1
	if Input.get_action_strength("move_down"):
		ypow -= -1
	return Vector2(
		xpow,
		ypow
	)

func shoot() -> void:
	var b = Bullet.instance()
	owner.add_child(b)
	b.transform = $Muzzle.global_transform

func calculate_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2
	) -> Vector2:
	var out = linear_velocity
	out.x = speed.x * direction.x
	out.y = speed.y * direction.y
	return out

func calculate_stomp_velocity(linear_velocity: Vector2, impulse: float) -> Vector2:
	var out: = linear_velocity
	out.y = -impulse
	return out

