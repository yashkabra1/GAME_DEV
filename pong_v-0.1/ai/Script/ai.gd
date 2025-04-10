extends StaticBody2D

var ball_pos : Vector2
var dist : int
var move_by : int
var win_height : int
var p_height : int
var top_limit : int
var bottom_limit : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	win_height = get_viewport_rect().size.y
	p_height = $Sprite2D.texture.get_height()
	
	# Define playable area (adjust based on your image borders)
	top_limit = p_height + 20 
	bottom_limit = win_height - p_height - (-50)
	
func _process(delta):
	#move AI paddle
	ball_pos = $"../ball".position
	dist = position.y - ball_pos.y
	if abs(dist) > get_parent().paddle_speed * delta:
		move_by = get_parent().paddle_speed * delta * (dist / abs(dist)) * 0.8
	else:
		move_by = dist
	
	position.y -= move_by
	
	
# Clamp paddle position within limits
	position.y = clamp(position.y, top_limit, bottom_limit)
