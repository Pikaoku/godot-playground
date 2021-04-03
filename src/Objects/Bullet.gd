extends Area2D

var speed = 750

var bloodskins = [
	# preload("res://assets/blood/blood_0.png"),
	preload("res://assets/blood/blood_1.png"),
	preload("res://assets/blood/blood_2.png"),
	preload("res://assets/blood/blood_3.png")
]

func _physics_process(delta):
	position += transform.x * speed * delta


func _on_Bullet_body_entered(body: Node) -> void:
	if body.is_in_group("enemies"):
		var blood = Sprite.new()
		blood.transform = body.global_transform
		blood.texture = bloodskins[randi() % 2]
		get_parent().get_node('blood').add_child(blood)
		body.queue_free()
	queue_free()
