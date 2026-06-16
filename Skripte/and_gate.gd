extends Node2D
const logic_dict = {
	Vector2(0, 0): 0,
	Vector2(0, 1): 0,
	Vector2(1, 0): 0,
	Vector2(1, 1): 1
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LogicGate.gate_type = "AND"

func _process(_delta: float) -> void:
	var inputs = Vector2($LogicGate.input1, $LogicGate.input2)
	$LogicGate.output = logic_dict[inputs]
