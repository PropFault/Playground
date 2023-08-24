extends State
class_name StateMachine
@export var active: State = null

func _state_process(delta: float):
	if active != null:
		active._state_process(delta)
