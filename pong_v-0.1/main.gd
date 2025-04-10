extends Sprite2D

var score := [0, 0]
const paddle_speed : int = 500

func _on_ball_timer_timeout():
	$ball.new_ball()


func _on_left_body_entered(body: Node2D) -> void:
	score[1] += 1
	$HUD/p2_score.text = str (score[1])
	$Ball_Timer.start()


func _on_right_body_entered(body: Node2D) -> void:
	score[0] += 1
	$HUD/p1_score.text = str (score[0])
	$Ball_Timer.start()
