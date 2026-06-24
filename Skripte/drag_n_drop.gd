extends Area2D
#handles drag and drop logic, add script and mouse signals to an Area2D child of a scene
#connect a node to the "dropped" signal for logic when node is dropped

var dragging: bool
var draggable: bool
var drag_offset: Vector2
var stop_drag = false

signal dropped

func _input(event: InputEvent) -> void:
	if stop_drag:
		return
	
	if event is InputEventScreenTouch:
		if not Global.dragging and draggable and event.pressed:
			Global.dragging = true
			dragging = true
			drag_offset = get_parent().global_position - get_global_mouse_position()
		elif dragging and not event.pressed:
			Global.dragging = false
			dragging = false
			dropped.emit()
	
	if event is InputEventScreenDrag and dragging:
		get_parent().global_position = get_global_mouse_position() + drag_offset


func _on_mouse_entered() -> void:
	draggable = true

func _on_mouse_exited() -> void:
	draggable = false
