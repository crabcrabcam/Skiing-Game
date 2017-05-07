extends Node2D

var current_speed = 20
var current_score = 0

#The furthest the flags can be away (width of the snow area)
const MAX_WIDTH = 200
#The minimum the flags can be away (width of the player * 1.5)
const MIN_WIDTH = 100

signal send_speed

onready var snow = preload("res://prefabs/Snow.tscn")

func _ready():
	
	emit_signal("send_speed", current_speed)
	
	
func spawn_flags():
	var left_flag = preload("res://prefabs/LeftFlag.tscn")
	var right_flag = preload("res://prefabs/RightFlag.tscn")
	var flags = preload("res://prefabs/Flags.tscn")
	
	var flags_instance = flags.instance()
	var left_flag_instance = left_flag.instance()
	var right_flag_instance = right_flag.instance()
	
	add_child(flags_instance)
	flags_instance.set_pos(Vector2(current_score, 0))


func _on_point_up():
	print(snow)
	var snow_instance = snow.instance()
	add_child(snow_instance)
	snow_instance.set_pos(Vector2(0, 90))
	print(snow_instance)
	emit_signal("send_speed", current_speed)
