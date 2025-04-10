extends StaticBody2D

var win_height : int
var p_heigth : int
var top_limit : int
var bottom_limit : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	win_height = get_viewport_rect().size.y
	p_heigth = $Sprite2D.texture.get_height()
	
# Define playable area (adjust based on your image borders)
	top_limit = p_heigth + 20 
	bottom_limit = win_height - p_heigth - (-50)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("paddle_right_up"):
		position.y -= get_parent().paddle_speed * delta
	elif Input.is_action_pressed("paddle_right_down"):
		position.y += get_parent().paddle_speed * delta

# Clamp paddle position within limits
	position.y = clamp(position.y, top_limit, bottom_limit)
