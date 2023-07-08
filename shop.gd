extends PopupPanel

signal healthy_button_pressed;
signal junk_button_pressed;
signal shovel_button_pressed;
signal grill_button_pressed;
signal tulip_button_pressed;
signal cactus_button_pressed;
signal tomato_button_pressed;
signal coffee_button_pressed;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_healthy_button_pressed():
	healthy_button_pressed.emit();
	hide();


func _on_junk_button_pressed():
	junk_button_pressed.emit();
	hide();


func _on_shovel_button_pressed():
	shovel_button_pressed.emit();
	hide();


func _on_grill_button_pressed():
	grill_button_pressed.emit();
	hide();


func _on_tulip_button_pressed():
	grill_button_pressed.emit();
	hide();


func _on_cactus_button_pressed():
	grill_button_pressed.emit();
	hide();


func _on_tomato_button_pressed():
	grill_button_pressed.emit();
	hide();


func _on_coffee_button_pressed():
	grill_button_pressed.emit();
	hide();
