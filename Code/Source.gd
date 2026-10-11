extends TextureButton
var isflying = false
var velocitycap = 2000.
var exploded = false
var frames_per_obstacle = 60 # godot runs at 60 fps. Multiply by 60 depending on how frequently you want obstacles to spawn, in this case 2-4 seconds.

#below are the variables refering to the obstacles


# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	# Get the parent RigidBody2D ("spaceship")
	var rigidbody = get_parent()
	
	# Connect its body_entered signal to your local function
	if rigidbody is RigidBody2D:
		rigidbody.body_entered.connect(_on_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var rigidbody = get_parent()
	var space = rigidbody.get_parent()
	var velocity = rigidbody.linear_velocity.length()
	var height = rigidbody.position.y
	var velocitylabel = rigidbody.get_child(3)
	var heightlabel = rigidbody.get_child(4)
	var rocket = rigidbody.get_child(0)
	
	var thrustsfx = rigidbody.get_child(6)
	var beepsfx = rigidbody.get_child(7)
	var boomsfx = rigidbody.get_child(8)
	
	
	var velocitystr = str(roundf(velocity))
	var heightstr = str(roundf(abs(height)))
	
	velocitylabel.text = "Velocity: " + velocitystr + "m/s"
	heightlabel.text = "Height: " + heightstr + "m"
	
	thrustsfx.pitch_scale = roundf(velocity/250)
	
	
	if velocity >= velocitycap: #explode if this happens
		if exploded == false:
			exploded = true
			rigidbody.get_child(9).visible = true
			thrustsfx.playing = false
			beepsfx.playing = true
			boomsfx.playing = true
			var musicsfx = rigidbody.get_child(10)
			musicsfx.playing = false
			print("explode")
			var boom = rigidbody.get_child(5)
			boom.visible = true
			var tween = create_tween()
			
			rigidbody.apply_impulse(Vector2(randf_range(-16, 16),-100),Vector2(0,-20))
			tween.tween_property(boom, "scale", Vector2(1, 1), .25)\
				.set_trans(Tween.TRANS_CUBIC)
			
			tween.tween_property(boom, "self_modulate:a", 0, 1.0)\
				.set_trans(Tween.TRANS_CUBIC)	
			rocket.texture_normal = load("res://Objects/Rocket/rocketmanexploded.png")
			rocket.texture_pressed = load("res://Objects/Rocket/rocketmanexploded.png")
	
	#print("Height: ", rigidbody.position.y)
	#print("Velocity: ", rigidbody.linear_velocity.length())
	if isflying == true:
		if exploded == false:
			rigidbody.apply_central_impulse(Vector2(0,-20))
	
	
	#print(frames_per_obstacle)
	if frames_per_obstacle <= 0:
		print("summon a new obstacle!")
		
		var random = 0 #randi_range(0, 1)
		print(random)
		if random == 0:
			print("lets summon a bird")
			var bird = space.get_child(4)
			var birdclone = bird.duplicate()
			space.add_child(birdclone) 
			#print(birdclone.get_parent())
			birdclone.global_position = rocket.global_position + Vector2(randi_range(-500,500),-750)
			birdclone.freeze = false
		
		
		frames_per_obstacle = 120
	else:
		frames_per_obstacle -= 1
		
		
func _on_button_down() -> void:
	print("Fly!") 
	isflying = true
	
func _on_button_up() -> void:
	print("Stop")
	isflying = false


func _on_body_entered(colliding_body: Node) -> void:
	if exploded == false:
		print("explode from collision!")
		exploded = true
		
		
		var rigidbody = get_parent()
		var thrustsfx = rigidbody.get_child(6)
		var beepsfx = rigidbody.get_child(7)
		var boomsfx = rigidbody.get_child(8)
		
		rigidbody.get_child(9).visible = true
		
		boomsfx.playing = true
		thrustsfx.playing = false
		var musicsfx = rigidbody.get_child(10)
		musicsfx.playing = false
		
			
		print("explode")
		var boom = rigidbody.get_child(5)
		boom.visible = true
		var tween = create_tween()
			
		rigidbody.apply_impulse(Vector2(randf_range(-16, 16),-100),Vector2(0,-20))
		tween.tween_property(boom, "scale", Vector2(1, 1), .25)\
			.set_trans(Tween.TRANS_CUBIC)
			
		tween.tween_property(boom, "self_modulate:a", 0, 1.0)\
			.set_trans(Tween.TRANS_CUBIC)	
		var rocket = rigidbody.get_child(0)
		rocket.texture_normal = load("res://Objects/Rocket/rocketmanexploded.png")
		rocket.texture_pressed = load("res://Objects/Rocket/rocketmanexploded.png")
		
		rigidbody.apply_central_impulse(Vector2(0, 2000))
		
		
		print("Crashed into: ", colliding_body.name)


func _on_button_button_down() -> void:
	pass # Replace with function body.
