extends Node2D

#starting variables
@export var money = 5000;
@export var energy = 10;

var safety = 0;
var wallLevel = 0;
var slots = [];
var selected;
var newSlotX; #for positioning each new slot
var newSlotY;

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
