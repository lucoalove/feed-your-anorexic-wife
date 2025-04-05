extends Control

# For making the cursor appear different on a control node: https://docs.godotengine.org/en/stable/classes/class_control.html#class-control-property-mouse-default-cursor-shape

# handles movement with mause :O

func _ready() -> void:
	mouse_default_cursor_shape = Control.CursorShape.CURSOR_DRAG
