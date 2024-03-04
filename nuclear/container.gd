extends Node2D
const velocity = Vector2(0,-500)
var state_liftup = false
@export var atom_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _physics_process(delta):
	if state_liftup and position.y > 1250 :
		position+=delta*velocity
		for border in get_children():
			border.constant_linear_velocity = velocity
	else:
		for border in get_children():
			border.constant_linear_velocity = Vector2.ZERO

	 	
func _on_button_pressed():
	state_liftup = not state_liftup
	
func _on_main_ready():
	var tap = 50.0
	for i in range(1,50):
		for j in range(1,25):
			var pos = Vector2(tap*i,tap*j)
			get_parent().spaw_atom(pos+position)
