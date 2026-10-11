extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_down() -> void:
	self.get_parent().get_child(8).visible = false
	self.get_parent().get_child(9).visible = false
	self.get_parent().get_child(0).freeze = false
	pass # Replace with function body.
