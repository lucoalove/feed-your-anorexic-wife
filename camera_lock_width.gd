extends Camera2D

var ARROW       = load("res://cursor_arrow.png")
var GRAB_CLOSED = load("res://cursor_grab_closed.png")
var GRAB_OPEN   = load("res://cursor_grab_open.png")

func _ready() -> void:
	
	get_tree().get_root().size_changed.connect(resize)
	resize()
	
	Input.set_custom_mouse_cursor(ARROW, Input.CursorShape.CURSOR_ARROW, Vector2(0, 0))
	set_click_state(false)

func resize() -> void:
	var z := get_window().size.x / 1200.0
	zoom.x = z
	zoom.y = z

func set_click_state(is_clicking):
	
	if is_clicking:
		Input.set_custom_mouse_cursor(GRAB_CLOSED, Input.CursorShape.CURSOR_DRAG, Vector2(16, 8))
	else:
		Input.set_custom_mouse_cursor(GRAB_OPEN, Input.CursorShape.CURSOR_DRAG, Vector2(16, 8))

func _input(event) -> void:
	
	# need to change mouse cursor based on element hover state AND whether
	# mouse is down or not (latter we must handle ourselves) for stuff like
	# arrow-click and grab
	
	if event.is_action_pressed("click"):
		set_click_state(true)
	elif event.is_action_released("click"):
		set_click_state(false)
