extends CharacterBody3D

@export var weight = 80.0
var normal_force :Vector3 = Vector3.ZERO
var force: Vector3 : 
	get:
		return self.velocity * weight
	set(value):
		self.velocity = value / weight
@export var default_friction_coefficient = 10
@export var gravity = Vector3(0, -10.0, 0)
@export var raycast: RayCast3D

func _process_collision(col : KinematicCollision3D, delta, vDelta):
	var vec = (vDelta * col.get_normal()).length() * col.get_normal()
	if(col.get_collider() is RigidBody3D):
		var body = col.get_collider() as RigidBody3D
		self.velocity = self.velocity + self.velocity * vec
		body.apply_force(-vec * weight)
		
func is_grounded():
	return is_on_floor() or raycast.is_colliding()

func _physics_process(delta):
	if(is_grounded()):
		var groundMvmt = self.velocity + self.velocity * gravity.normalized()
		groundMvmt = groundMvmt * default_friction_coefficient * delta
		self.velocity = self.velocity - groundMvmt
	self.velocity += gravity * delta
	var preSlide = velocity
	if(move_and_slide()):
		var slideDelta = velocity - preSlide
		for i in range(0, self.get_slide_collision_count()):
			var col = self.get_slide_collision(i)
			_process_collision(col, delta, slideDelta)

