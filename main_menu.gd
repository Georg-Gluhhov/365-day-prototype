extends Control
func _ready() -> void:
	$VBoxContainer/Label.text = str(GlobalManager.completed_prompts.size() ) + "/365 days
Progress"
	$VBoxContainer/ProgressBar.value = GlobalManager.completed_prompts.size() 
	var count: int= 0
	for i in GlobalManager.completed_prompts:
		count +=1 
		var task: TaskControl = TaskControl.new()
		task.label_text = GlobalManager.prompts.get(i)
		$VBoxContainer/VBoxContainer.add_child(task)
		if count>= 3:
			break
