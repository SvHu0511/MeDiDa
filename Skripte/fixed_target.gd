extends Node2D
@export var target : bool
var solved : bool
@onready var root_node = self.owner
var all_occupied = true
var showing_debug = false

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
	else:
		solved = false


func check_solution_button():
	if solved:
		root_node.get_node("GoodJob").visible = true
		await get_tree().create_timer(3).timeout
		root_node.get_node("GoodJob").visible = false
		get_tree().change_scene_to_file("res://Szenen/main/Level1_thankyou.tscn")
			
	else:
		root_node.get_node("TryAgain").visible = true
		await get_tree().create_timer(3).timeout
		root_node.get_node("TryAgain").visible = false


func debug_mode():
	if not showing_debug:
		if all_occupied:
			#add labels
			for slot in root_node.get_node("GateSlots").get_children():
				var output_label = Label.new()
				output_label.name = slot.name + " debug"
				output_label.text = "1" if slot.output == true else "0"
				var my_font = load("res://Assets/Watermelon Sugar.ttf")
				output_label.add_theme_font_override("font", my_font)
				output_label.add_theme_font_size_override("font_size", 50)
				output_label.add_theme_color_override("font_color", "yellow")
				output_label.position = slot.position + Vector2(100, -50)
				root_node.add_child(output_label)
			
			showing_debug = true
		else:
			root_node.get_node("FillAll").visible = true;
			await get_tree().create_timer(3).timeout
			root_node.get_node("FillAll").visible = false;
		
		
	else:
		#delete labels
		for slot in root_node.get_node("GateSlots").get_children():
			var name = slot.name + " debug"
			var label = root_node.get_node_or_null(name)
			if label:
				label.queue_free()
		showing_debug = false
