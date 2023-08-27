extends RichTextLabel
@export var input : CharacterInput
@export var root_machine : StateMachine

func _println(s):
	self.append_text(s)
	self.newline()
func _process(_delta):
	self.clear()
	_println("INPUT:" + text + "movement: " + str(input.movement))
	_println("Player machine state:")
	var level = 1
	var active = root_machine.active
	while active != null:
		var spaces = ""
		for i in range(0, level):
			spaces = spaces + " "
		_println(spaces + active.name)
		active = active as StateMachine
		if active != null:
			active = active.active
			level = level + 1
