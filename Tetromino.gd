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

const COLORS = [
	Color(0, 1, 1),  # I
	Color(0, 0, 1),  # J
	Color(1, 0.5, 0),  # L
	Color(1, 1, 0),  # O
	Color(0, 1, 0),  # S
	Color(1, 0, 1),  # T
	Color(1, 0, 0),  # Z
]

var blocks = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var index = randi() % ALL_TILES.size()
	var tile = ALL_TILES[index]
	var color = COLORS[index]
	for r in range(tile.size()):
		var block_row = []
		for c in range(tile[r].size()):
			if tile[r][c]:
				var block = block_scene.instantiate()
				block.set_color(color)
				add_child(block)
				block_row.append(block)
			else:
				block_row.append(null)
		blocks.append(block_row)
	update_block_positions()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

# Called when an event is received (such as a keypress).
func _input(event):
	if event.is_action_pressed("rotate"):
		rotate_blocks()

func rotate_blocks():
	# Let's rotate the board.
	var new_blocks = []
	for c in range(blocks[0].size()):
		var new_row = []
		for anti_r in range(blocks.size()):
			new_row.append(blocks[-anti_r - 1][c])
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
