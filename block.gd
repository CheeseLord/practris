extends Node2D

func get_size():
	return $CollisionShape2D.shape.size 


func set_color(color):
	$Sprite2D.set_modulate(color)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
