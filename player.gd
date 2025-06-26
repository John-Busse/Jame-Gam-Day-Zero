extends CharacterBody2D

signal end_game_signal
const SPEED = 300.0
@export var bullet_scene: PackedScene
var aim_dir:= Vector2i.RIGHT
var can_fire: bool = true

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("fire") and can_fire:
		can_fire = false
		var bullet = bullet_scene.instantiate()
		bullet.global_position = find_nearest_coord($GunSprite.get_global_position())
		bullet.direction = Vector2i(aim_dir)
		bullet.end_game.connect(end_game)
		add_child(bullet)


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		aim_dir.x = direction
		$GunSprite.position.y = -8
		$GunSprite.position.x = 8 * direction
	else:	#slows the player down
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if Input.is_action_pressed("aim_up"):
		aim_dir = Vector2.UP
		aim_dir.x = 0
		$GunSprite.position = Vector2(0, -16)
	move_and_slide()

func find_nearest_coord(point: Vector2) -> Vector2i:
	return Vector2i(16 * roundi(point.x / 16.0), 16 * roundi(point.y / 16.0))

func end_game():
	emit_signal("end_game_signal")
	
