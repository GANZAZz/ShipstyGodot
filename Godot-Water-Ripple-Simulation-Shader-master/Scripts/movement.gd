extends CharacterBody3D

 

const SPEED = 3 # Скорость корабля
const ROTATION_SPEED = 1.5 # Скорость поворота

var angular_acceleration = 0.5

func _process(delta):
	pass

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	var collShape = $Ship/capsuleColissionShape

func _physics_process(delta):
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0 , input_dir.y)).normalized()
	
	if Input.is_action_pressed("ui_right"):
		rotation.y = lerp_angle(rotation.y, atan2(direction.x, direction.z) - rotation.y, delta * angular_acceleration)
		#rotate_y(-ROTATION_SPEED * delta)  # Плавный поворот вправо
	elif Input.is_action_pressed("ui_left"):
		#rotate_y(ROTATION_SPEED * delta)
		rotation.y = lerp_angle(rotation.y, atan2(-direction.x, -direction.z) - rotation.y, delta * angular_acceleration)
		
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
