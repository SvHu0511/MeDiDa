extends Area2D
var occupied = false

var gate_type : String
@onready var input1 = $InputSlot
@onready var input2 = $InputSlot2
var output: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if input1.occupied and input2.occupied:
		output = Global.handle_logic([input1.input, input2.input], gate_type)
		$Wire/WireHead.input = output
