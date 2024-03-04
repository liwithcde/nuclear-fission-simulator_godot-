extends Camera2D
var _target_zoom : float =1.0
const MIN_ZOOM :float = 0.1
const MAX_ZOOM :float = 2.0
const ZOOM_INCREMENT:float= 0.1

func _unhandled_input(event):

	if event is InputEventMouseMotion:
		if event.button_mask & MOUSE_BUTTON_MASK_MIDDLE:
			position-=event.relative/_target_zoom
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				# zoom in 
				_target_zoom = min(_target_zoom+ZOOM_INCREMENT, MAX_ZOOM)
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				# zoom out
				_target_zoom = max(_target_zoom-ZOOM_INCREMENT, MIN_ZOOM)
				
				
func _physics_process(delta):
	zoom = _target_zoom*Vector2.ONE 
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
