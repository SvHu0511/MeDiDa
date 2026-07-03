extends Node2D

@onready var root_node = self.owner

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var all_occupied = true
	for slot in root_node.get_node("Board/GateSlots").get_children():
		if slot.occupied == false:
			all_occupied = false
	
	if $InputSlot.input and all_occupied:
		$ColorRect.color = Color.YELLOW
	else:
		$ColorRect.color = Color.DIM_GRAY
