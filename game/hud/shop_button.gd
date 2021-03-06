extends Button

onready var inventory = get_node('../Inventory')
onready var items = get_node('../Items')
onready var label = get_node('Label')

func _on_ShopButton_button_down():
	if inventory.visible:
		label.text = 'Back'
		inventory.visible = false
		items.visible = true
	else:
		label.text = 'Shop'
		inventory.visible = true
		items.visible = false

func _on_ShopButton_mouse_entered():
	self.self_modulate = Color(1, 1, 1, 1)

func _on_ShopButton_mouse_exited():
	self.self_modulate = Color(.7, .7, .7, 1)
