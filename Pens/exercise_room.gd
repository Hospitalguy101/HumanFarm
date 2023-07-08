extends Node2D

var human;
var garden;
var hasCof = false;
var hasCac = false;
var damageFactor = 1;
# Called when the node enters the scene tree for the first time.
func _ready():
	hide() # Replace with function body.
	garden = get_parent().get_parent();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for f in garden.farmers:
		if f == "cof":
			hasCof = true;
		elif f == "cac":
			hasCac = true;
	if human and visible:
		if hasCof: garden.energy += delta * 1.5 * damageFactor;
		else: garden.energy += delta * damageFactor;


func _on_area_2d_area_entered(area):
	if !human:
		if area.get_parent().is_in_group("human"):
			human = area.get_parent();
			area.get_parent().activity = "exercise";


func _on_area_2d_area_exited(area):
	if human:
		if area.get_parent().is_in_group("human"):
			human = null;
			area.get_parent().activity = "none";
