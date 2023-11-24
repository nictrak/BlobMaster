extends Node2D

var texture_shower: Node2D

var is_show_texture: bool = false

func _snip_to_map():
	var mouse_pos: Vector2 = get_global_mouse_position()
	var map_pos: Vector2 = TileMapService.get_instance().local_to_map(mouse_pos)
	var new_local_pos: Vector2 = TileMapService.get_instance().map_to_local(map_pos)
	position = new_local_pos

func show_texture(selected: Selectable):
	texture_shower.visible = true
	is_show_texture = true

func hide_texture():
	texture_shower.visible = false
	is_show_texture = false

# Called when the node enters the scene tree for the first time.
func _ready():
	texture_shower = $Sprite2D
	texture_shower.visible = false
	SelectionManager.select_down.connect(_on_select)
	SelectionManager.deselect_down.connect(_on_deselect)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_snip_to_map()
	
func _on_select(selected: Selectable):
	show_texture(selected)
	
func _on_deselect():
	hide_texture()
