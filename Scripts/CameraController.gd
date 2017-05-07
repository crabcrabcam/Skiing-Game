extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var velocity = Vector2()
var speed_y = 10

func _ready():
	set_process(true)

func _process(delta):
	velocity.y = speed_y * delta
	move(velocity)

func _on_World_send_speed(speed):
	print("Speed")
	print(speed)
	speed_y = speed
