extends "res://src/Actors/Generics/Actor.gd"

onready var player = get_node("../../player")

const skins = [
	preload("res://assets/zombies/zombiebasic_0.png"),
	preload("res://assets/zombies/zombiebasic_1.png"),
	preload("res://assets/zombies/zombiebasic_2.png"),
	preload("res://assets/zombies/zombiebasic_3.png"),
	preload("res://assets/zombies/zombiebasic_4.png"),
	preload("res://assets/zombies/zombiebasic_5.png")
]

func _ready() -> void:
	$skin.texture = skins[randi() % 5]
	set_physics_process(false)

func _physics_process(delta: float) -> void:
	_velocity = position.direction_to(player.global_position) * speed
	look_at(player.global_position)
	if position.distance_to(player.global_position) > 2:
		_velocity = move_and_slide(_velocity)
	
