extends RigidBody2D

var win_size : Vector2
const start_speed : int = 500
const accel : int = 50
var speed : int 
var dir : Vector2
const max_y_vector  : float = .6

#called when the node enters the scene tree for the first time 
func _ready():
	win_size = get_viewport_rect().size
	
func new_ball():
#randomize start position and direction 
	position.x = win_size.x / 2
	position.y = randi_range(200 , win_size.y -200)
	speed = start_speed
	dir = rand_dir()

func _physics_process(delta):
	var collision = move_and_collide(dir * speed * delta)
	var collider
	if collision:
		collider = collision.get_collider()
	#if ball hits the paddle
		if collider == $"../Player1" or collider == $"../Player2":
			speed += accel
			dir = new_dir(collider)
		#if hits the wall
		else:
			dir = dir.bounce(collision.get_normal())

func rand_dir():
	var new_dir := Vector2()
	new_dir.x = [1,-1].pick_random()
	new_dir.y = randf_range(-1,1)
	return new_dir.normalized()
	
func new_dir(collider):
	var ball_y = position.y
	var pad_y = collider.position.y
	var dist = ball_y - pad_y
	var new_dir := Vector2()
	var pad_height = 0
	
	if collider.has_node("Sprite2D") and collider.get_node("Sprite2D").texture:
		pad_height = collider.get_node("Sprite2D").texture.get_height()
	else:
		pad_height = 100 
	
	#flip the horizontal direction
	new_dir.x = -1 if dir.x > 0 else 1
	
	new_dir.y = (dist / (pad_height / 2)) * max_y_vector
	return new_dir.normalized()
	
	
