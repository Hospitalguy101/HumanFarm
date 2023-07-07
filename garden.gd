extends Node2D

#starting variables
@export var money = 5000;
@export var energy = 10;

var selecting = false;
var selectGoal;
var humanFlesh = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	energy = 0;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_buy_human_button_pressed():
	if money < 400: 
		pass
	else:
		money -= 400;
		get_node("Pen").addHuman();


func _on_human_food_button_pressed():
	selecting = true;
	selectGoal = "Human";


func _on_shop_button_pressed():
	$Shop.visible = true;


func _on_shop_healthy_button_pressed():
	selecting = true;
	selectGoal = "Healthy";


func _on_shop_grill_button_pressed():
	pass # Replace with function body.


func _on_shop_junk_button_pressed():
	selecting = true;
	selectGoal = "Junk";


func _on_shop_shovel_button_pressed():
	pass # Replace with function body.
