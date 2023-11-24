extends Node2D

signal select_down(selected: Selectable)
signal change_selection(old_selected: Selectable, new_selected: Selectable)

signal deselect_down

var current_selection: Selectable = null

func _on_select(old_selected: Selectable, new_selected: Selectable):
	pass

func select(selected: Selectable):
	select_down.emit(selected)
	if current_selection != selected:
		change_selection.emit(current_selection, selected)
	current_selection = selected
	
func deselect():
	if current_selection == null:
		return
	deselect_down.emit()
	current_selection = null
	
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		deselect()
