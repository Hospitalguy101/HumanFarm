extends Node2D

#starting variables
@export var energy = 5000;

var selecting = false;
var selectGoal;
var humanFlesh = 0;
var farmers = []
var hasGrill = false;

var penPath = preload("res://Pens/pen.tscn");

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func endGame(reason):
	if reason == "revolution":
		$EndScreen/Title.text = "YOUR HUMANS REVOLTED!";
		$EndScreen/Buttons/Description.text = "Your humans were too unhappy and broke through the gate! They managed to escape your farm and contact the authorities. You wont be seeing anyhting but the inside of a jail cell for a long time.";
	$EndScreen.visible = true;


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


func _on_pen_2_button_pressed():
	$GridContainer2/Pen3Button.visible = true;
	$GridContainer2/Pen2Button.queue_free();
	var newNode = $GridContainer2/Control.duplicate();
	$GridContainer2.add_child(newNode);
	$GridContainer2.move_child(newNode, 1);
	
	var newPen = penPath.instantiate();
	add_child(newPen);
	newPen.position.x = 387;
	newPen.position.y = -126;

func _on_pen_3_button_pressed():
	$GridContainer2/Pen4Button.visible = true;
	$GridContainer2/Pen3Button.queue_free();
	var newNode = $GridContainer2/Control.duplicate();
	$GridContainer2.add_child(newNode);
	$GridContainer2.move_child(newNode, 1);
	
	var newPen = penPath.instantiate();
	add_child(newPen);
	newPen.position.x = -387;
	newPen.position.y = 126;


func _on_pen_4_button_pressed():
	$GridContainer2/Pen4Button.queue_free();
	
	var newPen = penPath.instantiate();
	add_child(newPen);
	newPen.position.x = 387;
	newPen.position.y = 126;
