extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if $InputSlot.input:
		$ColorRect.color = Color.YELLOW
	else:
		$ColorRect.color = Color.DIM_GRAY
