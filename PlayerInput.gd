extends CharacterInput

func _get_movement(_delta):
	return Vector2(Input.get_axis("Left", "Right"), Input.get_axis("Forward", "Backward"))
func _get_run(_delta):
	return Input.is_action_pressed("Run")
func _get_jump(_delta):
	return Input.is_action_pressed("Jump")
func _get_attack_primary(_delta):
	return Input.is_action_pressed("Attack Primary")
func _get_attack_secondary(_delta):
	return Input.is_action_pressed("Attack Secondary")
func _get_crouch(_delta):
	return Input.is_action_pressed("Crouch")
