extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(5):
		var random = randi_range(0, 3)
		print(random)
		if random == 0:
			print("Here comes a birdie")
			var bird = RigidBody2D.new()
			var sprite = Sprite2D.new()
			var hitbox = 
			bird.reparent(self)
			sprite.reparent(bird)
			
			bird.position = Vector2(-26, 241)
			sprite.position = bird.position
			bird.texture = load("res://Objects/Birds/birdie.png")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
