extends CharacterState
class_name WalkingState
## f, l, r, b
@export var top_walking_speed : Vector4 = Vector4(20, 20, 20, 10)


func _state_process(delta):
	var movement = Vector2.ZERO
	#L/R
	movement.x = top_walking_speed.y * min(input.movement.x, 0.0) + top_walking_speed.z * max(input.movement.x, 0.0)
	#F/B
	movement.y = top_walking_speed.x * min(input.movement.y, 0.0) + top_walking_speed.w * max(input.movement.y, 0.0)
	self.body.velocity = self.body.velocity + Vector3(movement.x, 0, movement.y) * body.transform.basis * delta
