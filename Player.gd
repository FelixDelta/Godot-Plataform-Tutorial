extends KinematicBody2D

var motion = Vector2(0 , 0)
var speed = 320
var gravity = 1000
var jump_force = -550

func _physics_process(delta):
	print(motion)
	_move(delta)
	

func _move(delta):
	if !is_on_floor():
		motion.y += gravity * delta
	
	var direction = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	
	if Input.is_action_pressed("ui_up") and is_on_floor():
		motion.y += jump_force
	
	motion.x = direction * speed
	motion = move_and_slide(motion, Vector2.UP)
