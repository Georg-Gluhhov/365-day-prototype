extends Node

var prompts: Dictionary[int, String] = {
	0: "Smile at a stranger",
	1: "Do yoga for 10 minutes",
	2: "Water plants",
	3: "Do 10 push-ups",
	4: "Go to sleep earlier",
	5: "Smile at yourself in the mirror",
	6: "Write down 5 good things happened to you today",
	7: "Meditate for 10 minutes",
	8: "Clean your working space",
	9: "Read 5 pages of the book",
	10: "Call your parents",
	11: "Drink a cup of water",
	12: "Remind your friends you love them",
	13: "Put aside 10 euros",
	14: "Put aside 5 euros",
	15: "Colour in colourbook",
	16: "Say hello to a world",
	17: "Take a 5 minute walk",
	18: "Take a 10 minute walk",
	19: "Create a weekly plan in a diary",
	20: "Bake something",
	21: "Read 10 pages of the book",
	22: "Call your grandparents",
	23: "Make a salad",
	24: "Do a breathing exercise",
	25: "Tell yourself \"I can do it!\"",
	26: "Write a letter to your future self",
	27: "Listen to an educational podcast",
	28: "Text your friend you haven't seen in a long time",
	29: "Assemble a puzzle",
	30: "Try out new style"
}

var completed_prompts: Array[int] = []
var last_completed_task_time: int = 0


func complete_task(prompt_id: int) -> void:
	completed_prompts.append(prompt_id)
	
	last_completed_task_time = Time.get_unix_time_from_system()
	
	save_game()


func has_completed_task_today() -> bool:
	if last_completed_task_time == 0:
		return false
	
	var now: int = Time.get_unix_time_from_system()
	var today_start: int = now - (now % 86400) 
	var last_completion_day_start: int = last_completed_task_time - (last_completed_task_time % 86400)
	
	return last_completion_day_start >= today_start

func save_game(path: String = "user://savegame.dat") -> void:
	var data: Dictionary = {
		"completed_prompts": completed_prompts,
		"last_completed_task_time": last_completed_task_time
	}
	
	var file := FileAccess.open(path, FileAccess.WRITE)
	if file:
		file.store_var(data)
		file.close()


func load_game(path: String = "user://savegame.dat") -> void:
	if not FileAccess.file_exists(path):
		completed_prompts = []
		last_completed_task_time = 0
		return
	
	var file := FileAccess.open(path, FileAccess.READ)
	if file:
		var loaded: Variant = file.get_var()
		if loaded is Dictionary:
			var data: Dictionary = loaded
			
			if data.has("completed_prompts") and data["completed_prompts"] is Array:
				completed_prompts = data["completed_prompts"] as Array[int]
			
			if data.has("last_completed_task_time") and data["last_completed_task_time"] is int:
				last_completed_task_time = data["last_completed_task_time"]
		
		file.close()

func _ready():
	if LocalNotification:
		LocalNotification.init()
		LocalNotification.requestPermission()
		
		await LocalNotification.on_permission_request_completed
		
		if LocalNotification.isPermissionGranted():
			LocalNotification.showDaily("Daily Reminder", "It's 4 PM! Time to check the New Task!", 16, 0, "daily_4pm")
			
