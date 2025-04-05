extends Control

# For making the cursor appear different on a control node: https://docs.godotengine.org/en/stable/classes/class_control.html#class-control-property-mouse-default-cursor-shape

# handles movement with mause :O

var is_hovered = false
var is_held = false

func _ready() -> void:
	mouse_default_cursor_shape = Control.CursorShape.CURSOR_DRAG
	
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _process(_delta: float) -> void:
	
	if is_held:
		
		var mouse_world_pos = get_viewport().get_mouse_position() * 1200 / get_viewport().get_visible_rect().size.x
		
		position = mouse_world_pos - Vector2(32, 32)

func _on_mouse_entered():
	
	is_hovered = true

func _on_mouse_exited():
	
	if !is_held:
		is_hovered = false

func _input(event) -> void:
	
	if event.is_action_released("click"):
		is_held = false
	
	elif is_hovered:
		
		if event.is_action_pressed("click"):
			is_held = true
