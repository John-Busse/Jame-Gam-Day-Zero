extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func end_game(win: bool) -> void:
	set_visible(true)
	if win:
		$MarginContainer/VBoxContainer/TitleLabel.set_text("You Win!")
		$MarginContainer/VBoxContainer/TextLabel.set_text("You killed everything!")
	else:
		$MarginContainer/VBoxContainer/TitleLabel.set_text("You Lose!")
		$MarginContainer/VBoxContainer/TextLabel.set_text("You didn't destroy all the targets!")
