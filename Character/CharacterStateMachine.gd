extends StateMachine
class_name CharacterStateMachine

@export var _settings : CharacterSettings

var body : CharacterBody3D :
	get:
		return _settings.body
	set(value):
		_settings.body = value

var input : CharacterInput :
	get:
		return _settings.input
	set(value):
		_settings.input = value
