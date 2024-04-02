extends CharacterBody3D

const SPEED = 100  # Скорость корабля
const ROTATION_SPEED = 3  # Скорость поворота

func _process(delta):
	var motion = Vector3()
	var rotation = 0

	if Input.is_action_pressed("ui_right"):
		rotation -= ROTATION_SPEED
	if Input.is_action_pressed("ui_left"):
		rotation += ROTATION_SPEED

	if Input.is_action_pressed("ui_down"):
		motion.z += 1
	if Input.is_action_pressed("ui_up"):
		motion.z -= 1

	motion = motion.normalized() * SPEED
	
  
