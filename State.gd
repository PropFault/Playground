extends Node
class_name State



func _state_process(_delta: float):
	pass

func activate():
	if get_parent() is StateMachine:
		get_parent().active = self
