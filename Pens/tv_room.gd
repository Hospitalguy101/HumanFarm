extends Node2D

var human;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if human:
		human.happiness += delta;


func _on_area_2d_area_entered(area):
	if !human:
		if area.get_parent().group == "human":
			human = area.get_parent();


func _on_area_2d_area_exited(area):
	if human:
		if area.get_parent().group == "human":
			human = null;
