extends CharacterStateMachine

func _state_process(delta:float):
	super(delta)
	if(self.input.crouch):
		active = $Crouch
	else:
		active = $Default
