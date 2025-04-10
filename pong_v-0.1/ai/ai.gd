extends Sprite2D

var score := [0, 0]
const paddle_speed : int = 500

func _on_ball_timer_timeout():
	$ball.new_ball()
	


func _on_left_body_entered(body: Node2D) -> void:
	score[1] += 1
	$HUD/ai_score.text = str (score[1])
	$ball_Timer.start()


func _on_right_body_entered(body: Node2D) -> void:
	score[0] += 1
	$HUD/P1_score.text = str (score[0])
	$ball_Timer.start()
