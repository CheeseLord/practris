extends Area2D

@warning_ignore("integer_division")

# TODO temporary so we can test insert_tetromino()
@export var tetromino_scene: PackedScene

@export var width:  int = 10
@export var height: int = 20

# The tetromino that is currently falling (and its coords)
var tetromino = null
var tet_row: int
var tet_col: int

# The (fixed) blocks from previous tetrominos on the ground
var blocks: Array[Array]

# Called when the node enters the scene tree for the first time.
func _ready():
	blocks = []
	for r in range(height):
		var row = []
		for c in range(width):
			row.append(null)
		blocks.append(row)

	# TODO temporary to test insert_tetromino()
	insert_tetromino(tetromino_scene.instantiate())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func insert_tetromino(new_tetromino):
	# TODO something better than just crashing if this fails?
	assert(tetromino == null)

	# FIXME HACK: Add it as a child before we get its dimensions, since we need
	# to add it to the scene graph (i.e., call block._ready()) to initialize the
	# array that get_dimensions() queries. This is only needed because we're
	# instantiating the tetromino in play_area itself, and will hopefully go
	# away once it gets moved here from the "next" area.
	add_child(new_tetromino)

	var tet_width = new_tetromino.get_dimensions().x
	# TODO for tetrominos like the line with empty space up top, should probably
	# insert them flush at the top rather than with an empty row above.
	tet_row = 0
	tet_col = (width - tet_width) / 2

	new_tetromino.position = grid_indices_to_pos(tet_row, tet_col)
	tetromino = new_tetromino

# Return the (Godot) coordinates of (the top-left corner of) the cell at the
# given indices
func grid_indices_to_pos(row: int, col: int) -> Vector2:
	var my_size = $CollisionShape2D.shape.size
	return Vector2(col * my_size.x / width, row * my_size.y / height)
