extends Area2D
@export var gate_type : String
var dragging: bool
var draggable: bool
var drag_offset: Vector2

var can_be_dropped = false
var slot_ref: Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not Global.dragging and draggable and event.pressed:
			Global.dragging = true
			dragging = true
			drag_offset = position - get_global_mouse_position()
		elif dragging and not event.pressed:
			drop()
	
	if event is InputEventMouseMotion and dragging:
		position = get_global_mouse_position() + drag_offset

func drop() -> void:
	Global.dragging = false
	dragging = false
	if can_be_dropped:
		global_position = slot_ref.global_position

func _on_mouse_entered() -> void:
	draggable = true

func _on_mouse_exited() -> void:
	draggable = false


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("gate_slot"):
		can_be_dropped = true
		slot_ref = area

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("gate_slot"):
		can_be_dropped = false
