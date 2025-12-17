extends Control

func hide_all() -> void:
	var tween: = get_tree().create_tween()
	var sidebut: = %SideMenu
	tween.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(sidebut, "position:x", -562, 0.2)
	%MainMenu.hide()
	%Tasks.hide()
	%Completed.hide()
func _on_daily_task_pressed() -> void:
	hide_all()
	%Tasks.show()


func _on_completed_task_pressed() -> void:
	hide_all()
	%Completed.show()


func _on_about_pressed() -> void:
	pass # Replace with function body.


func _on_level_pressed() -> void:
	pass # Replace with function body.


func _on_button_pressed() -> void:
	hide_all()
	%MainMenu.show()
