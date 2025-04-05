extends Camera2D

# For making the cursor appear different on a control node: https://docs.godotengine.org/en/stable/classes/class_control.html#class-control-property-mouse-default-cursor-shape

var cursor_arrow = load("res://cursor_arrow.png")

func _ready() -> void:
	
	get_tree().get_root().size_changed.connect(resize)
	resize()
	
	Input.set_custom_mouse_cursor(cursor_arrow, Input.CursorShape.CURSOR_ARROW, Vector2(0, 0))

func resize() -> void:
	var z := get_window().size.x / 1200.0
	zoom.x = z
	zoom.y = z

func _input(event) -> void:
	
	# need to change mouse cursor based on element hover state AND whether
	# mouse is down or not (latter we must handle ourselves) for stuff like
	# arrow-click and grab
	
	if event.is_action_pressed("click"):
		Input.set_custom_mouse_cursor(null, Input.CursorShape.CURSOR_ARROW, Vector2(0.2, 0.2))
	elif event.is_action_released("click"):
		Input.set_custom_mouse_cursor(cursor_arrow, Input.CursorShape.CURSOR_ARROW, Vector2(0, 0))
