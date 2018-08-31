extends Button

onready var hud = get_node('../../../')
onready var shop_button = get_node('../../ShopButton')
onready var inventory = get_node('../../Inventory')
var item
var cost

const TOWER = 7

func _ready():
	if get_child(0).name != 'Tower':
		item = int(get_child(0).name[8])
	else:
		item = TOWER
	cost = item * 100

func _on_Button_mouse_entered():
	self.self_modulate = Color(1, 1, 1, 1)

func _on_Button_mouse_exited():
	self.self_modulate = Color(.7, .7, .7, 1)

func _on_Button_button_down():
	if hud.gold >= cost:
		if item == TOWER:
			print('tower placement')
		else:
			var slot = inventory.get_empty_slot()
			if slot:
				shop_button._on_ShopButton_button_down()
				shop_button.pressed = false
				hud.update_gold(-cost)
				inventory.add_gem_on_slot(slot, item)