extends Node2D

var gem
var source
var target

func _ready():
	self.add_child(gem)
	self.position = get_global_mouse_position()

func move_gem(node = source, _gem = gem):
	node.add_child(_gem)
	node.gem = _gem
	if node.is_in_group('slot'):
		_gem.position = node.offset
	elif node.is_in_group('tower'):
		_gem.position = Vector2(0, 0)
		_gem.timer.start()

func swap_gems():
	var gem_on_target = target.gem
	if gem_on_target != null:
		target.remove_child(gem_on_target)
		move_gem(source, gem_on_target)
	move_gem(target)

func _input(event):
	if event.is_class('InputEventMouseMotion'):
		self.position = get_global_mouse_position()
	elif event.is_action_released('ui_select'):
		self.remove_child(gem)
		if target == null:
			move_gem()
		else:
			swap_gems()
		if source.is_in_group('slot') and source != target:
			source._on_Slot_mouse_exited()
		get_parent().cursor = null
		self.queue_free()