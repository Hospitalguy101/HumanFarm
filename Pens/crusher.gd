extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	if area.get_parent().is_in_group("human"):
		$Blood.emitting = true
		$crunch.playing = true
		var pen = area.get_parent().get_parent();
		for n in pen.get_children():
			if n.is_in_group("human"):
				n.happiness -= 5;
		pen.get_parent().humanFlesh += 1;
		area.get_parent().queue_free();
