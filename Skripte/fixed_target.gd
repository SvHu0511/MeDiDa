extends Node2D
@export var target : bool
@export var solved : bool
@onready var root_node = self.owner
@export var all_occupied = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	all_occupied = true
	for slot in root_node.get_node("GateSlots").get_children():
		if slot.occupied == false:
			all_occupied = false
	
	if all_occupied:
		if $InputSlot.input == target:
			solved = true
		if $InputSlot.input != target:
			solved = false


func check_solution_button():
	if solved:
		root_node.get_node("GoodJob").visible = true
		await get_tree().create_timer(3).timeout
		root_node.get_node("GoodJob").visible = false
	else:
		root_node.get_node("TryAgain").visible = true
		await get_tree().create_timer(3).timeout
		root_node.get_node("TryAgain").visible = false


func debug_mode():
	if all_occupied:
		for slot in root_node.get_node("GateSlots").get_children():
			var output_label = Label.new()
			output_label.text = str(slot.output)
			output_label.position = slot.position + Vector2(100, -50)
			root_node.add_child(output_label)
