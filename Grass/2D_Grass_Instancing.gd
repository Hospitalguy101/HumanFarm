extends Node2D

@onready var fps_label = $FPSLabel
@onready var grass_particles = $GrassParticles

func _ready():
	grass_particles.emitting = true

func _process(_delta):
	grass_particles.material.set_shader_parameter("player_pos", get_global_mouse_position())
