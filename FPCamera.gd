extends Camera3D
@export var body: Node
@export var mouse_sens: float = 0.5

func _input(event):
	if event is InputEventMouseMotion:
		print(event.relative)
		do_mouse_movement(event.relative / 1000.0 * mouse_sens)

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
func do_mouse_movement(movement):
	body.rotate_y(-movement.x);
	self.rotate_x(-movement.y);
