extends Node

class_name Selectable

var selected: bool = false

func _on_button_down():
	selected = true
	SelectionManager.select(self)
