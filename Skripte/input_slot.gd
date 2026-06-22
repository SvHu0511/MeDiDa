extends Area2D
var input: bool
var occupied: bool

func connect_wire(wire_input):
	input = wire_input
	occupied = true

func disconnect_wire():
	input = false
	occupied = false
