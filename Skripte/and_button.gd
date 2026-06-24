extends Button

var and_gate_scene = preload("res://Szenen/gates/And_gate.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func on_pressed():
	print("pressed AND")
	var instance = and_gate_scene.instantiate()
	instance.position = Vector2(100, 100)
	get_tree().current_scene.add_child(instance)
	print("done creating")
