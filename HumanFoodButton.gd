extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "Use Human Flesh (" + str(get_parent().humanFlesh) + ")";
	if get_parent().humanFlesh == 0:
		disabled = true;
	else:
		disabled = false;
	print(disabled);
