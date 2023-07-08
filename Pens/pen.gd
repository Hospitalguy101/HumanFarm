extends Node2D

const humanPath = preload("res://Human/human.tscn");
var beds = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	#TEMP:
	addHuman();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func addHuman():
	var newHuman = humanPath.instantiate();
	add_child(newHuman);
	if beds: newHuman.health += 5;
