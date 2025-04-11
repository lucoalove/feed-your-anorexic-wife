extends Control

const FRUIT = preload("res://fruit.tscn")

var is_hovered := false

func _ready() -> void:
	
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered():
	is_hovered = true
	Mouse.add_grabby_target()

func _on_mouse_exited():
	is_hovered = false
	Mouse.remove_grabby_target()

func _input(event) -> void:
		
	if is_hovered and event.is_action_pressed("click"):
		
		var fruit = FRUIT.instantiate()
		
		Mouse.add_grabby_target()
		fruit.is_held = true
		fruit.position = position
		
		get_node("/root/Root").add_child(fruit)
