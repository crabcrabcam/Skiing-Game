extends Node2D

var current_speed = 10
var current_score = 0

#The furthest the flags can be away (width of the snow area)
const MAX_WIDTH = 200
#The minimum the flags can be away (width of the player * 1.5)
const MIN_WIDTH = 100

signal send_speed

onready var snow = get_node("Snow")

func _ready():
	print(snow)
	var snowInstance = snow.instance()
	snowInstance.set_pos(Vector2(10, 10))
	print(snowInstance)
	
	emit_signal("send_speed", current_speed)


func on_score_up():
	emit_signal("send_speed", current_speed)
	
	
func spawn_flags():
	var left_flag = get_node("LeftFlag")
	var right_flag = get_node("RightFlag")
	
	