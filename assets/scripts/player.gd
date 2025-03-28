extends CharacterBody2D

class_name Player
@onready var animator = $AnimationPlayer
var viewport_size
var speed = 300.0
var gravity = 15.0
var jump_velocity = -800.0
var max_fall_velocity = 1000.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	viewport_size = get_viewport_rect().size
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	Input.is_action_pressed("A")
	Input.is_action_pressed("D")
	if velocity.y  > 0:
		if animator.current_animation != "fall":
			animator.play("fall")
			print("player is falling")
		pass
	elif velocity.y  < 0:
		if animator.current_animation != "jump":
			animator.play("jump")
			print("player is jump")

func _physics_process(delta):
	
	velocity.y +=gravity
	if velocity.y > max_fall_velocity:
		velocity.y = max_fall_velocity
	var direction = Input.get_axis("move_left","move_right")
	if direction:
		velocity.x = direction * speed
	else:
			velocity.x = move_toward(velocity.x,0,speed/20)
			
	
		
	move_and_slide()
	
	var margin = 20
	if global_position.x > viewport_size.x+margin:
		global_position.x = 0-margin
	if global_position.x < 0-margin:
		global_position.x = viewport_size.x+margin
	
func jump():
	velocity.y = jump_velocity
	#print("D:",direction,"V:",velocity.y)
