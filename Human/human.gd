extends CharacterBody2D

enum {
	WALK,
	IDLE,
	GRABBED,
	PLANT,
	BABY,
	DEAD,
}

var health;
var happiness;
var growth;
var clickTimer

var activity = "none";
var hasTom = false;

var State = WALK
var Speed = randi_range(25, 45)
var directionX = randf_range(-1,1)
var directionY = randf_range(-1,1)
var Change = randf_range(1,4)
var randIdle = randi_range(0,5)
var deathTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	deathTimer = 300.0
	health = 5;
	happiness = 1;
	growth = 0;
	position.x = randf_range(-20, 20)
	position.y = randf_range(-20, 20)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var garden = get_parent().get_parent();
	for f in garden.farmers:
		if f == "tom":
			hasTom = true;

	if activity == "none":
		if hasTom:
			growth += 3 * health * delta;
		else:
			growth += 2 * health * delta;
	else: growth += health * delta;
	#if it is fully grown, it starts losing health slowly (eventually dies)
	if growth > 500:
		health -= delta;

	deathTimer -= delta
	if deathTimer <= 0.0:
		State = DEAD
	if State == WALK:
		Walk(delta)
	if State == IDLE:
		Idle(delta)
	if State == GRABBED:
		Grabbed()

func Plant(delta):
	pass
func Baby(delta):
	pass
func Dead(delta):
	pass
func Walk(delta):
	velocity.x = directionX*Speed
	velocity.y = directionY*Speed
	Change-=delta
	if Change<=0.0:
		directionX = randf_range(-1,1)
		directionY = randf_range(-1,1)
		Change = randf_range(1,4)
		randIdle = randi_range(0,3)
		Speed = randi_range(25, 45)

	if randIdle == 3:
		State = IDLE
	move_and_slide()
func Idle(delta):
	velocity.x = 0
	velocity.y = 0
	Change-=delta
	if Change<=0.0:
		Change = randf_range(1,4)
		randIdle = randi_range(0,3)

	if randIdle == 3 and activity == "none":
		State = WALK
	move_and_slide()

func Grabbed():
	self.global_position = get_global_mouse_position()
	if Input.is_action_just_released("Click"):
		$HumanInfoMenu.visible = !$HumanInfoMenu.visible;
		State = IDLE
		if get_parent().get_node("ExerciseRoom").visible:
			if position.x > 112 and position.x < 214 and position.y < -3 and position.y > -105:
				position.x = 160;
				position.y = -53;
		elif position.x < -100 or position.x > 100 or position.y > 100 or position.y < -100:
			position.x = 0;
			position.y = 0;


func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("Click"):
		State = GRABBED
		var garden = get_parent().get_parent();
		if !garden.selecting:
			for n in get_parent().get_children():
				if n.is_in_group("human"):
					n.get_node("HumanInfoMenu").visible = false;
			$HumanInfoMenu.visible = !$HumanInfoMenu.visible;
		elif garden.selectGoal == "Healthy":
			health += 5;
			happiness -= 5;
			garden.selecting = false;
		elif garden.selectGoal == "Junk":
			health -= 5;
			happiness += 5;
			garden.selecting = false;
		elif garden.selectGoal == "Human":
			health -= 5;
			happiness -= 5;
			garden.selecting = false;
			garden.humanFlesh -= 1;
