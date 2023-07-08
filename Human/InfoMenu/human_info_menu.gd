extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_kill_button_pressed():
	var pen = get_parent().get_parent();
	for n in pen.get_children():
		if n.is_in_group("human"):
			n.happiness -= 5;
	pen.get_parent().humanFlesh += 1;
	get_parent().queue_free();
