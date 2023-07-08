extends Node2D

var human;
var garden;
var hasTul = false;
var hasCac = false;
var damageFactor = 1;
# Called when the node enters the scene tree for the first time.
func _ready():
	hide() # Replace with function body.
	garden = get_parent().get_parent();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for f in garden.farmers:
		if f == "tul":
			hasTul = true;
		elif f == "cac":
			hasCac = true;
	#cac prevents all damage
	if hasCac: damageFactor = 1;
	if human:
		if hasTul: human.happiness += delta * 1.5 * damageFactor;
		else: human.happiness += delta * damageFactor;


func _on_area_2d_area_entered(area):
	if !human:
		if area.get_parent().group == "human":
			human = area.get_parent();
			area.get_parent().activity = "tv";


func _on_area_2d_area_exited(area):
	if human:
		if area.get_parent().group == "human":
			human = null;
			area.get_parent().activity = "none";
