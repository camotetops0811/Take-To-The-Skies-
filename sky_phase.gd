extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().process_frame
	print(self.get_parent())
	for i in range(25):
		#print("Island ", i)
		var islandcopy = self.get_parent().get_child(5).duplicate()
		owner.add_child(islandcopy)
		islandcopy.position = Vector2(randi_range(0,1200), i * randi_range(-400,-600))
		#print(islandcopy)
		#var chance = randi_range(0, 1)
	
	for c in range(200):
		#print("Cloud", c)
		var cloudcopy = self.get_parent().get_child(6).duplicate()
		owner.add_child(cloudcopy)
		cloudcopy.position = Vector2(randi_range(0,1200), c * randi_range(-125,-200))
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
