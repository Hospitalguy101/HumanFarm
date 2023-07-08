extends CharacterBody2D

const SPEED = 1.0
var dragging = false

func _ready():
	set_process_input(true)

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			dragging = true
		else:
			dragging = false
	elif event is InputEventMouseMotion and dragging:
		position = get_global_mouse_position()
