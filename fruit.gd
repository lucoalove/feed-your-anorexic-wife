extends Control

const DAMP := 5.0
const ACCEL := 0.2

var is_hovered := false
var is_held := false
var velocity := Vector2(0, 0)

func _ready() -> void:
	
	# https://docs.godotengine.org/en/stable/classes/class_control.html#class-control-property-mouse-default-cursor-shape
	mouse_default_cursor_shape = Control.CursorShape.CURSOR_DRAG
	
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _process(delta: float) -> void:
	
	position += velocity * delta
	velocity = lerp(velocity, Vector2.ZERO, delta * DAMP)
	
	if is_held:
		
		var mouse_world_pos = get_viewport().get_mouse_position() * 1200 / get_viewport().get_visible_rect().size.x
		
		velocity += (mouse_world_pos - (size / 2) - position) * ACCEL

func _on_mouse_entered():
	is_hovered = true

func _on_mouse_exited():
	is_hovered = false

func _input(event) -> void:
	
	if event.is_action_released("click"):
		is_held = false
		
	if is_hovered and event.is_action_pressed("click"):
		is_held = true
