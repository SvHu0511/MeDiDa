extends Button
var output: bool

func _on_toggled(toggled_on: bool) -> void:
	output = toggled_on
	$ColorRect.visible = toggled_on
	for wire in get_children():
		if wire.has_node("WireHead"):
			wire.get_node("WireHead").input = output
