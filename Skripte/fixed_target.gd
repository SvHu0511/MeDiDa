extends Node2D
@export var target : bool
@export var solved : bool
@onready var root_node = self.owner

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var all_occupied = true
	#print(root_node.get_node("GateSlots").get_children())
	for slot in root_node.get_node("GateSlots").get_children():
		if slot.occupied == false:
			all_occupied = false
	
	if all_occupied:
		if $InputSlot.input == target:
			solved = true
		if $InputSlot.input != target:
			solved = false
