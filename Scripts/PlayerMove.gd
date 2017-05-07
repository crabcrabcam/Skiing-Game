#This movement is mostly based off the GDQuest 

extends KinematicBody2D

#0 = not moving, 1 = right, -1 = left
var input_direction = 0
var direction = 0
var speed_x = 0
var speed_y = 0
var velocity = Vector2()

const ACCELERATION = 1000
const DECCELERATION = 2000
const MAX_SPEED = 600
const MAX_DOWN_SPEED = 200
#const GRAVITY = 1

func _ready():
	print("Accel")
	print(Input.get_accelerometer())
	
	set_process(true)
	
#Update
func _process(delta):
	
	if input_direction:
		direction = input_direction
	
	var move_left = Input.is_action_pressed("move_left")
	var move_right = Input.is_action_pressed("move_right")
	var stop_moving = !Input.is_action_pressed("move_left") && !Input.is_action_pressed("move_right")
	
	if move_left:
		input_direction = -1
	elif move_right:
		input_direction = 1
	elif stop_moving:
		input_direction = 0

	if input_direction == -direction:
			speed_x /= 2
	if input_direction:
		speed_x += ACCELERATION * delta
	else:
		speed_x -= DECCELERATION * delta
	
	#Adds gravity
	#speed_y = 
	
	#So speed can't go over max_speed
	#Check first isn't below second, or above first
	#Because speed is always positive and then we multiply by direction it's fine to have the lower one be 0.
	#If we were only using speed as the direction and just setting it to negative for left then we'd set the second arg as -MAX_SPEED.
	speed_x = clamp(speed_x, 0, MAX_SPEED)

	velocity.y = speed_y * delta
	velocity.x = speed_x * delta * direction

	move(velocity)
	

#When the player gets a speed
func _on_World_send_speed(speed):
	print("Speed")
	print(speed)
	speed_y = speed


#When the player enters the flag body
func _on_flag_body_enter( body ):
	print("Entered")
	print(body)
	#RUN GAME OVER HERE
