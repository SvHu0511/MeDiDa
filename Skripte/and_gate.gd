extends Panel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@export var gate_type = "AND"

var dragging = false
var ofset = Vector2(0,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	if dragging:
		position = get_global_mouse_position() - ofset


func _on_button_button_up() -> void:
	dragging = false


func _on_button_button_down() -> void:
	print("clicked")
	dragging = true
	ofset = get_global_mouse_position()
