extends Node2D
@export var gate_type : String
@onready var input1 = $InputSlot
@onready var input2 = $InputSlot2
var output: bool

var can_be_dropped = false
var slot_ref: Area2D

func _ready() -> void:
	if !Global.freeplay_mode:
		$InputSlot.queue_free()
		$InputSlot2.queue_free()
		$Wire.queue_free()

# unused for now (same with inputs and wire from logic_gate)
func _process(_delta: float) -> void:
	if !Global.freeplay_mode:
		return
	
	if input1.occupied and input2.occupied:
		output = Global.handle_logic([input1.input, input2.input], gate_type)
		$Wire/WireHead.input = output


#when dropping the piece, snap to a slot if possible
func _on_area_2d_dropped() -> void:
	if can_be_dropped:
		global_position = slot_ref.global_position
		slot_ref.occupied = true
		slot_ref.gate_type = gate_type

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("gate_slot") and !area.occupied:
		can_be_dropped = true
		slot_ref = area

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("gate_slot"):
		can_be_dropped = false
		if area == slot_ref:
			slot_ref.occupied = false
			slot_ref.gate_type = ""
			slot_ref = null
