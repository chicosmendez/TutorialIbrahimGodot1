extends RigidBody2D

export (int) var velocidad_min
export (int) var velocidad_max
var tipo_malo = ["Caminando", "Vuelo"]

func _ready():
	$AnimatedSprite.animation = tipo_malo[randi() % tipo_malo.size()]


func _on_Visibilidad_screen_exited():
	queue_free()
