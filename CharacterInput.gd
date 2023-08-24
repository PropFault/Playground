extends Node
class_name CharacterInput

var movement: Vector2
var run: bool
var jump: bool
var attack_primary: bool
var attack_secondary: bool
var crouch: bool

func _get_movement(_delta):
	pass
func _get_run(_delta):
	pass
func _get_jump(_delta):
	pass
func _get_attack_primary(_delta):
	pass
func _get_attack_secondary(_delta):
	pass
func _get_crouch(_delta):
	pass;

func _process(delta):
	movement = _get_movement(delta)
	run = _get_run(delta)
	jump = _get_jump(delta)
	attack_primary = _get_attack_primary(delta)
	attack_secondary = _get_attack_secondary(delta)
	crouch = _get_crouch(delta)
