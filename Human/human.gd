extends Node2D

var health;
var happiness;
var growth;

# Called when the node enters the scene tree for the first time.
func _ready():
	health = 5;
	happiness = 1;
	growth = 0;
	position.x = randf_range(-20, 20)
	position.y = randf_range(-20, 20)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	growth += 1 * health * delta;
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
		health -= 5;
		happiness -= 5;
		garden.selecting = false;
		garden.humanFlesh -= 1;
