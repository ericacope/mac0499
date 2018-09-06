extends Node2D

onready var creep_wr = weakref(creep)

var vel = 40
var fx_script
var dmg
var vector
var creep # Assigned at gem.gd
var gem_color

func _physics_process(delta):
	if creep_wr.get_ref():
		vector = creep.position - self.position * 2
		vector = vector.normalized()
		self.position += vector * vel/10

func _on_Area2D_area_entered(area):
	var _creep = area.get_parent()
	if _creep != null and _creep.is_in_group('creep'):
		var fx = fx_script.new()
		_creep.take_damage(dmg, gem_color)
		fx.apply_fx(_creep, dmg)
		_queue_free()

func _queue_free():
	if not self.is_queued_for_deletion():
		var self_idx = creep.projectiles.find(self)
		creep.projectiles.remove(self_idx)
		self.queue_free()
