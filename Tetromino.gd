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

var blocks = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var tile = ALL_TILES[randi() % ALL_TILES.size()]
	for r in range(tile.size()):
		var block_row = []
		for c in range(tile[r].size()):
			if tile[r][c]:
				var block = block_scene.instantiate()
				add_child(block)
				block_row.append(block)
			else:
				block_row.append(null)
		blocks.append(block_row)
	update_block_positions()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("rotate"):
		rotate_blocks()

func rotate_blocks():
	# Let's rotate the boards.
	var new_blocks = []
	for anti_c in range(blocks[0].size()):
		var new_row = []
		for r in range(blocks.size()):
			new_row.append(blocks[r][-anti_c - 1])
		new_blocks.append(new_row)
	blocks = new_blocks
	update_block_positions()

func update_block_positions():
	for r in range(blocks.size()):
		for c in range(blocks[r].size()):
			var block = blocks[r][c]
			if block:
				var block_size = block.get_size()
				block.position = Vector2(c * block_size.x, r * block_size.y)
