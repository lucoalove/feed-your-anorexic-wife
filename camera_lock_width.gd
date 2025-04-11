extends Camera2D

func _ready() -> void:
	
	get_tree().get_root().size_changed.connect(resize)
	resize()

func resize() -> void:
	
	var z := get_window().size.x / 1200.0
	zoom.x = z
	zoom.y = z
