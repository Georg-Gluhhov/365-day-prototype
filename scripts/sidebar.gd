extends Button


func _on_pressed() -> void:
	var tween: = get_tree().create_tween()
	var sidebut: = %SideMenu
	%SideMenu.show()
	sidebut.position.x = -562
	tween.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(sidebut, "position:x", 0, 0.3)
