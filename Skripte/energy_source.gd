extends Button
var output: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_toggled(toggled_on: bool) -> void:
	output = toggled_on
	$ColorRect.visible = toggled_on
	for wire in get_children():
		if wire.has_node("WireHead"):
			wire.get_node("WireHead").input = output
