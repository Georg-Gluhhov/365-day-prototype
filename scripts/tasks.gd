extends Control
var today_task: int = 0 
func _ready() -> void:
	GlobalManager.load_game()
	if !GlobalManager.has_completed_task_today():
		today_task = randi_range(0, GlobalManager.prompts.size())
		$VBoxContainer/TaskControl.change_text(GlobalManager.prompts.get(today_task))
	else:
		$VBoxContainer/TaskControl.change_text("You completed the task!")

func _on_complete_pressed() -> void:
	if !GlobalManager.has_completed_task_today():
		GlobalManager.complete_task(today_task)

func _on_abort_pressed() -> void:
	_ready()
