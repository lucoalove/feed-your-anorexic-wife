extends Node

var ARROW       = load("res://cursor_arrow.png")
var GRAB_CLOSED = load("res://cursor_grab_closed.png")
var GRAB_OPEN   = load("res://cursor_grab_open.png")

var down := false
var grabby_targets := 0

func _ready() -> void:
	reload_visual()

func _input(event) -> void:
	
	if event.is_action_pressed("click"):
		down = true
		reload_visual()
	elif event.is_action_released("click"):
		down = false
		reload_visual()

func add_grabby_target():
	grabby_targets += 1
	reload_visual()

func remove_grabby_target():
	grabby_targets -= 1
	reload_visual()

func reload_visual():
	
	print(grabby_targets)
	
	if grabby_targets > 0:
		
		if down:
			Input.set_custom_mouse_cursor(GRAB_CLOSED, Input.CursorShape.CURSOR_ARROW, Vector2(16, 8))
		else:
			Input.set_custom_mouse_cursor(GRAB_OPEN, Input.CursorShape.CURSOR_ARROW, Vector2(16, 8))
		
	else:
		Input.set_custom_mouse_cursor(ARROW, Input.CursorShape.CURSOR_ARROW, Vector2(0, 0))
