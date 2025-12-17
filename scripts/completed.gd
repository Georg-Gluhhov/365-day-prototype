extends Control
func _ready() -> void:
	for i in GlobalManager.completed_prompts:
		
		var task: TaskControl = TaskControl.new()
		task.label_text = GlobalManager.prompts.get(i)
		$VBoxContainer/ScrollContainer/VBoxContainer.add_child(task)
