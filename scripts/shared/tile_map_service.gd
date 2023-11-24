extends Node

class_name TileMapService

var tile_map: TileMap = null
static var instance: TileMapService = null

func _ready():
	tile_map = $TileMap
	instance = self

static func get_instance() -> TileMapService:
	return instance

func map_to_local(map_pos: Vector2) -> Vector2:
	return tile_map.map_to_local(map_pos)

func local_to_map(local_pos: Vector2) -> Vector2:
	return tile_map.local_to_map(local_pos)
