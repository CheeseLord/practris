extends Node2D

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


# Called when the node enters the scene tree for the first time.
func _ready():
	tile = ALL_TILES[randi() % ALL_TILES.size()].duplicate(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
