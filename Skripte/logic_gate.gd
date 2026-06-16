extends Node2D
@export var gate_type : String
var input1: bool
var input2: bool
#@onready var input_dict = {
#		get_node("InputSlot"): input1,
#		get_node("InputSlot2"): input2
#	}
var output: bool

var can_be_dropped = false
var slot_ref: Area2D

func _ready() -> void:
	pass

#when dropping the piece, snap to a slot if possible
func _on_area_2d_dropped() -> void:
	if can_be_dropped:
		global_position = slot_ref.global_position

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("gate_slot"):
		can_be_dropped = true
		slot_ref = area

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("gate_slot"):
		can_be_dropped = false
		slot_ref = null
