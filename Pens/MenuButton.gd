extends MenuButton


# Called when the node enters the scene tree for the first time.
func _ready():
	get_popup().id_pressed.connect(_on_item_menu_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_item_menu_pressed(id: int):
	if id == 0: #upgrade walls
		if get_parent().get_parent().energy < 300:
			print("Cannot afford");
		else: 
			print("Bought walls");
			get_parent().get_parent().energy -= 300;
	elif id == 1: #TV ROOM
		if get_parent().get_parent().energy < 300:
			print("Cannot afford");
		else: 
			get_parent().get_node("TVRoom").visible = true;
			get_parent().get_parent().energy -= 300;
	elif id == 2: #Treadmills
		if get_parent().get_parent().energy < 150:
			print("Cannot afford");
		else: 
			get_parent().get_node("ExerciseRoom").visible = true;
			get_parent().get_parent().energy -= 150;
	elif id == 3:
		if get_parent().get_parent().energy < 150:
			print("Cannot afford");
		else: 
			get_parent().beds = true;
			get_parent().get_parent().energy -= 150;
			for h in get_parent().get_children():
				if h.is_in_group("human"):
					h.health += 5;
