extends MeshInstance3D
class_name Graphics
static var instance : Graphics = null
var _im = ImmediateMesh.new()
func set_active():
	instance = self

func _init():
	if(instance == null):
		set_active()
	self.mesh = _im
	
func _draw_line(start: Vector3, end: Vector3, width: Curve, resolution: float = 10):
	var line = end - start
	var dir = line.normalized()
	var w_base = dir.rotated(Vector3.UP, 90.0).normalized()
	
	var stepper = 1
	_im.surface_begin(Mesh.PRIMITIVE_TRIANGLE_STRIP)
	#Initial step
	_im.surface_add_vertex(start - w_base * width.sample(0.0))
	while(stepper < resolution):
		var step = stepper / resolution
		var w = w_base * width.sample(step)
		var p = start + dir * step
		_im.surface_add_vertex(p + w)
		_im.surface_add_vertex(p - w)
		stepper = stepper + 1
	_im.surface_end()
