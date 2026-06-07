extends Area2D

@export var gate_type = "AND"
var dragging = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dragging:
		position = get_global_mouse_position()


func _on_button_button_down() -> void:
	print("clicked")
	dragging = true


func _on_button_button_up() -> void:
	dragging = false
