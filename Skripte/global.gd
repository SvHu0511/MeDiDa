extends Node
var dragging = false #prevents drag-n-drop from grabbing multiple gates at the same time
var freeplay_mode = false

const and_logic = {
	Vector2(0, 0): 0,
	Vector2(0, 1): 0,
	Vector2(1, 0): 0,
	Vector2(1, 1): 1
}
const or_logic = {
	Vector2(0, 0): 0,
	Vector2(0, 1): 1,
	Vector2(1, 0): 1,
	Vector2(1, 1): 1
}

func handle_logic(inputs: Array, gate_type: String) -> bool:
	match gate_type:
		"OR":
			return or_logic.get(Vector2(inputs[0], inputs[1]))
		"AND":
			return and_logic.get(Vector2(inputs[0], inputs[1]))
		_:
			return false
