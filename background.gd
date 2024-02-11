extends Node2D

@export var grid_num_col = 8 # TODO fix this magic number which is clearly wrong
@export var grid_num_row = 10 # TODO fix this magic number which is clearly wrong

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _draw():
	var play_area = $"../PlayAreaRect".shape.size 
	var grid_height = play_area.y / grid_num_row
	var grid_width = play_area.x / grid_num_col
	
	# Draw the background rectangle
	draw_rect(Rect2(Vector2(0,0), $"../PlayAreaRect".shape.size), Color(1,1,1))
	
	# Draw lines spearating rows
	for r in range(1, grid_num_row):
		draw_line(Vector2(0.0, r * grid_height), Vector2(play_area.x, r * grid_height), Color.GRAY, 1.0)
		
	# Draw lines spearating cols
	for c in range(1, grid_num_col):
		draw_line(Vector2(c * grid_width, 0.0), Vector2(c * grid_width, play_area.y), Color.GRAY, 1.0)
	pass
