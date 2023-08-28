extends WalkingState
@export var dead_movement_speed = 1.0

func _state_process(delta):
	var v_before = self.body.velocity
	super._state_process(delta)
	var dir = (self.body.velocity - v_before).normalized()
	if self.body.velocity.length_squared() > v_before.length_squared():
		self.body.velocity = v_before + dir * dead_movement_speed * delta
		
