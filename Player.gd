extends Node3D
@onready var layer0 = get_node("Body/Logic/Layer0")
@onready var layer1 = get_node("Body/Logic/Layer1")
@export var jumping_speed: float = 20.0
@export var jump_control_duration: float = 2.0
var timer: float
var is_jumping: float
@onready var body = $Body

func _process(delta):
	layer0._state_process(delta)
	layer1._state_process(delta)

func _physics_process(delta):
	var jump_pressed = Input.is_action_pressed("Jump")
	
	if body.is_grounded() and jump_pressed and timer < jump_control_duration:
		is_jumping = true
	if is_jumping and jump_pressed:
		body.velocity = body.velocity + jumping_speed * body.basis.y * delta
	
	if not jump_pressed or timer > jump_control_duration and not jump_pressed:
		is_jumping = false
		timer = 0.0
	print(is_jumping)
	timer = timer + delta
