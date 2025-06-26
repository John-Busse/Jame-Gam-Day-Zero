extends Node2D

func _ready() -> void:
	#DisplayServer.window_set_size(Vector2i(1280, 720))
	pass # Replace with function body.
  
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func end_game():
	if $Enemies.get_child_count() != 0:
		#stil enemies alive!
		print("You lose!")
	else:
		#all enemies defeated!
		print("You Win!")
