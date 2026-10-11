extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.get_parent().apply_central_impulse(Vector2(-5,0))
		
	pass

func _on_button_down() -> void:
	print("Die!") 
	self.texture_normal = load("res://Objects/Birds/birdiedead.png")
	self.texture_pressed = load("res://Objects/Birds/birdiedead.png")
	self.get_parent().gravity_scale = 1
