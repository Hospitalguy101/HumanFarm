extends Node2D

#starting variables
@export var energy = 5000;

var selecting = false;
var selectGoal;
var humanFlesh = 0;
var farmers = []
var hasGrill = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_buy_human_button_pressed():
	if energy < 400: 
		pass
	else:
		energy -= 400;
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
	hasGrill = true;


func _on_shop_junk_button_pressed():
	selecting = true;
	selectGoal = "Junk";


func _on_shop_shovel_button_pressed():
	pass


func _on_shop_cactus_button_pressed():
	farmers.add("cac");


func _on_shop_coffee_button_pressed():
	farmers.add("cof");


func _on_shop_tomato_button_pressed():
	farmers.add("tom");


func _on_shop_tulip_button_pressed():
	farmers.add("tul");
