extends Node2D

const humanPath = preload("res://Human/human.tscn");
var beds = false;
var avgHappiness;
var wallLevel = 1;

# Called when the node enters the scene tree for the first time.
func _ready():
	addHuman();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var happySum = 0;
	var numHumans = 0;
	for h in get_children():
		if h.is_in_group("human"):
			happySum += h.happiness;
			numHumans += 1;
	if numHumans > 0:
		avgHappiness = happySum/numHumans;
	
	#Revolution lose con
	if (avgHappiness < 0 and wallLevel <= 2 and numHumans > 8):
		get_parent().endGame("revolution");
		print("A")

func addHuman():
	var newHuman = humanPath.instantiate();
	add_child(newHuman);
	if beds: newHuman.health += 5;


func _on_hitbox_area_entered(area):
	if area.get_parent().is_in_group("human"):
		area.get_parent().activity = "none";
