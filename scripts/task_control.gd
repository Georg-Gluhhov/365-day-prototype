extends Control
class_name TaskControl
@export var label_text: String = "Example"
var label: Label = Label.new()

func change_text(text: String) -> void:
	label.text = text
func _ready() -> void:
	set_anchors_preset(Control.PRESET_FULL_RECT)
	custom_minimum_size = Vector2(0,125)
	
	var color:ColorRect = ColorRect.new()
	color.set_anchors_preset(Control.PRESET_FULL_RECT)
	color.color = "#5B63C4"
	add_child(color)
	
	label.theme = load("res://assets/themes/main.tres")
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label.set_anchors_preset(Control.PRESET_FULL_RECT)
	add_child(label)
	label.text = label_text
	
	
