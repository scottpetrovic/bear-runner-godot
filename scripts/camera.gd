extends Camera

export(float) var align = 0.0
var offsetDistance = Vector3(0, 0, 6)
var elasticFactor = 2;

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	var player = get_node("../Player")
	if player != null:
		var direction = player.translation - translation + offsetDistance
		var h_direction = Vector2(direction.x, direction.z)

		# x (forward/back)   z (left/right)  
		translation += delta * elasticFactor * Vector3(h_direction.x, 0 , h_direction.y)
