extends Button

var or_gate_scene = preload("res://Szenen/gates/Or_gate.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func on_pressed():
	var instance = or_gate_scene.instantiate()
	instance.position = Vector2(1065, 900)
	get_tree().current_scene.add_child(instance)
