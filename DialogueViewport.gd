@tool
extends SubViewport
@export var resMult = 1.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var ninepatch = $Dialogue2D/Background
	var required_size = Vector2(ninepatch.size.x + (ninepatch.patch_margin_right - ninepatch.patch_margin_left), (ninepatch.size.y + (ninepatch.patch_margin_bottom - ninepatch.patch_margin_top)))
	self.size = required_size
