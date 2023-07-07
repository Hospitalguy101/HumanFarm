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
	$HumanInfoMenu.visible = !$HumanInfoMenu.visible;
