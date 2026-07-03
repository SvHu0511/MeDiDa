extends Label

@export var input : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for wire in get_children():
		if wire.has_node("WireHead"):
			wire.get_node("WireHead").input = input


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
