extends CharacterStateMachine

func _state_process(delta:float):
	super(delta)
	var inputLenSq = input.movement.length_squared()
	if(not body.is_grounded()):
		active = $AirborneState
	elif(inputLenSq < 0.1):
		active = $IdleState
	elif(input.run):
		active = $RunningState
	else:
		active = $WalkingState
	active._state_process(delta)
