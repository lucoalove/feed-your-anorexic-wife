extends Control

const FRUIT = preload("res://fruit.tscn")

var is_hovered := false

func _ready() -> void:
	
	# https://docs.godotengine.org/en/stable/classes/class_control.html#class-control-property-mouse-default-cursor-shape
	mouse_default_cursor_shape = Control.CursorShape.CURSOR_DRAG
	
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered():
	is_hovered = true

func _on_mouse_exited():
	is_hovered = false

func _input(event) -> void:
		
	if is_hovered and event.is_action_pressed("click"):
		
		var fruit = FRUIT.instantiate()
		fruit.is_held = true
		fruit.position = position
		get_node("/root/Root").add_child(fruit)
