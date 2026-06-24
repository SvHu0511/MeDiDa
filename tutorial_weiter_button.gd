extends Button

var slide = 1;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed():
	var picture = find(slide);
	get_node(picture).visible = !get_node(picture).visible
	slide += 1;
	
	if slide == 9:
		get_tree().change_scene_to_file("res://Szenen/main/main.tscn");
	else:
		picture = find(slide);
		get_node(picture).visible = !get_node(picture).visible
	
	
func find(slide):
	var picture;
	match slide:
		1:
			picture = "../Tutorial1"
		2:
			picture = "../Tutorial2"
		3: 
			picture = "../Tutorial3"
		4:
			picture = "../Tutorial4"
		5:
			picture = "../Tutorial5"
		6:
			picture = "../Tutorial6"
		7:
			picture = "../Tutorial7"
		8:
			picture = "../Tutorial8"
	return picture;
