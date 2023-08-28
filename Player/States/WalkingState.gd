extends CharacterState
class_name WalkingState
## f, l, r, b
@export var top_walking_speed : Vector4 = Vector4(20, 20, 20, 10)


func _state_process(delta):
	var movement = Vector2.ZERO
	var f = -min(input.movement.y,0.0)
	var b = max(input.movement.y, 0.0)
	var l = -min(input.movement.x, 0.0)
	var r = max(input.movement.x, 0.0)
	
	var top_speed = top_walking_speed.x * f + top_walking_speed.w * b + top_walking_speed.y * l + top_walking_speed.z * r
	var divident = abs(sign(f)) + abs(sign(b)) + abs(sign(l)) + abs(sign(r))
	if divident > 0.0:
		top_speed = top_speed / divident
	print("top", top_speed)
	movement = input.movement * top_speed 
	
	self.body.velocity = self.body.velocity + (movement.x * body.transform.basis.x + movement.y  * body.transform.basis.z) * delta
