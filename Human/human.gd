extends Node2D

var health;
var happiness;
var growth;
var activity = "none";
var hasTom = false;

var garden;

# Called when the node enters the scene tree for the first time.
func _ready():
	garden = get_tree().get_root().get_child(1);
	health = 5;
	happiness = 1;
	growth = 0;
	position.x = randf_range(-20, 20)
	position.y = randf_range(-20, 20)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for f in garden.farmers:
		if f == "tom":
			hasTom = true;
	
	if activity == "none": 
		if hasTom:
			growth += 3 * health * delta;
		else:
			growth += 2 * health * delta;
	else: growth += health * delta;
	#if it is fully grown, it starts losing health slowly (eventually dies)
	if growth > 500:
		health -= delta;
	


func _on_button_pressed():
	var garden = get_parent().get_parent();
	if !garden.selecting:
		for n in get_parent().get_children():
			if n.is_in_group("human"):
				n.get_node("HumanInfoMenu").visible = false;
		$HumanInfoMenu.visible = !$HumanInfoMenu.visible;
	elif garden.selectGoal == "Healthy":
		health += 5;
		happiness -= 5;
		garden.selecting = false;
	elif garden.selectGoal == "Junk":
		health -= 5;
		happiness += 5;
		garden.selecting = false;
	elif garden.selectGoal == "Human":
		if !garden.hasGrill: health -= 5;
		else: health += 10
		happiness -= 5;
		garden.selecting = false;
		garden.humanFlesh -= 1;
