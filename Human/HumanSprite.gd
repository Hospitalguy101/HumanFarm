extends AnimatedSprite2D

var planttype
# Called when the node enters the scene tree for the first time.
func _ready():
	planttype = randi_range(1,3)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().directionX > 0:
		self.flip_h = true
	else:
		self.flip_h = false
	if get_parent().State == get_parent().WALK:
		self.play("Walk")
	if get_parent().State == get_parent().IDLE:
		self.play("Idle")
	if get_parent().State == get_parent().GRABBED:
		self.play("Shake")
	if get_parent().State == get_parent().DEAD:
		self.play("Dead")
