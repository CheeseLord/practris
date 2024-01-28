extends Node2D

@export var block_scene: PackedScene

# https://strategywiki.org/wiki/Tetris/Rotation_systems#Super_rotation_system
const ALL_TILES = [
	[[0, 0, 0, 0], [1, 1, 1, 1], [0, 0, 0, 0], [0, 0, 0, 0]],  # I
	[[1, 0, 0], [1, 1, 1], [0, 0, 0]],  # J
	[[0, 0, 1], [1, 1, 1], [0, 0, 0]],  # L
	[[1, 1], [1, 1]],  # O
	[[0, 1, 1], [1, 1, 0], [0, 0, 0]],  # S
	[[0, 1, 0], [1, 1, 1], [0, 0, 0]],  # T
	[[1, 1, 0], [0, 1, 1], [0, 0, 0]],  # Z
]

var tile
var blocks = []

# Called when the node enters the scene tree for the first time.
func _ready():
	tile = ALL_TILES[randi() % ALL_TILES.size()].duplicate(true)
	for r in range(tile.size()):
		for c in range(tile[r].size()):
			if tile[r][c]:
				var block = block_scene.instantiate()
				var block_size = block.get_size()
				block.position = Vector2(c * block_size.x, r * block_size.y)
				blocks.append(block)
				add_child(block)
 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

