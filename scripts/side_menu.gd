extends Control

func hide_all() -> void:
	%MainMenu.hide()
	%Tasks.hide()
	%SideMenu.hide()
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
