extends Area2D
#handles drag and drop logic, add script and mouse signals to an Area2D child of a scene
#connect a node to the "dropped" signal for logic when node is dropped

var dragging: bool
var drag_offset: Vector2
var stop_drag = false

signal dropped

#handles object movement (not in _on_input_event() to prevent movement cutting off if dragging too fast)
func _input(event: InputEvent) -> void:
	if (event is InputEventScreenDrag or event is InputEventMouseMotion) and dragging:
		get_parent().global_position = get_global_mouse_position() + drag_offset

#handles picking up/dropping an object when its collision is clicked/tapped
func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if stop_drag:
		return
	
	if event is InputEventScreenTouch or (event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT):
		if not Global.dragging and event.pressed:
			Global.dragging = true
			dragging = true
			drag_offset = get_parent().global_position - get_global_mouse_position()
		elif dragging and event.is_released():
			Global.dragging = false
			dragging = false
			dropped.emit()
	
