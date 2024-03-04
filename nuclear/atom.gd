extends RigidBody2D
@export var break_num :int =3
@export var break_expect_s:float = 0.001
@export var neutron :PackedScene
# Called when the node enters the scene tree for the first time.
var _picked = false 
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if randf()< break_expect_s *  delta :
		print("衰变而爆炸")
		nucleus_break()


func nucleus_break():
	for i in range(break_num):
		var neutron = neutron.instantiate()
		var velocity = 400
		var direction = randf_range(-PI,PI)
		neutron.velocity = velocity* Vector2.RIGHT.rotated(direction)
		neutron.position = position
		add_sibling(neutron)
	queue_free()
		
func _input_event(viewport, event, shape_idx):
	var mouse_event = event as InputEventMouseButton
	if mouse_event and mouse_event.pressed:
		_picked = true 
		print(" pressed ")
func _input(event):
	var mouse_event = event as InputEventMouseButton
	
	if mouse_event and not mouse_event.pressed and _picked:
		_picked = false  
		print("One click on me")
		nucleus_break()



func _on_nucleus_area_entered(area:Area2D):
	
	
	if  area.is_in_group("neutron") :
		
		area.queue_free()
		print("中子射入而爆炸")
		nucleus_break()
	pass # Replace with function body.
