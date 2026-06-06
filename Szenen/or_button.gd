extends Button

var or_gate_scene = preload("res://Szenen/gates/or_gate.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_pressed():
	print("pressed OR")
	var instance = or_gate_scene.instantiate()
	instance.position = Vector2(600, 100)
	var desired_size = Vector2(100, 50)
	var texture_size = instance.get_child(0).texture.get_size()
	instance.scale = desired_size / texture_size
	get_tree().current_scene.add_child(instance)
	print("done creating")
