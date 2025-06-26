extends Area2D

signal end_game
const SPEED = 100.0
var direction: Vector2i
var can_reflect: bool = true


func _physics_process(delta: float) -> void:
	#velocity = direction * SPEED
	position += direction * SPEED * delta


func _on_timer_timeout() -> void:
	can_reflect = true


func _on_body_entered(body: Node2D) -> void:
	if body.get_collision_layer() & 1 << 4:
		emit_signal("end_game")
		queue_free()
	else:
		if can_reflect:
			can_reflect = false
			set_global_position(body.get_global_position())
			if abs(rad_to_deg(body.transform.get_rotation()) - 45.0) < 0.5:
				direction = Vector2i(-direction.y, -direction.x)
			elif abs(rad_to_deg(body.transform.get_rotation()) + 45.0) < 0.5:
				direction = Vector2i(direction.y, direction.x)
				print(direction)
			$Timer.start(0.2)
