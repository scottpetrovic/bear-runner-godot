extends KinematicBody

# simple follow script that takes an object "playerRef" and slowly goes towards it


# Types of rigid bodies
# Rigid - meant to simulate Netwonian physics. Good for objects that mostly need to have gravity and be pushed around
# Character - possible use for character. Mostly a rigidbody, but disables rotation
# Static - Ideal for walls and ground since they don't move at all
# Kinematic - possible use for character. Inherits from kinematic body

var playerRef
var movementSpeed = 0.4 
var directionToGo = Vector3(0,0,0) # calculated each frame

# Called when the node enters the scene tree for the first time.
func _ready():
	playerRef =  get_node("../Player") # maybe a better way to get this??


func _physics_process(delta):
	if playerRef:
		directionToGo = playerRef.translation - translation
		directionToGo.y = 0 # stops Bear from flying to follow Player
	else:
		print("player reference not found")

	var linear_velocity = directionToGo * (movementSpeed * delta)	
	var collisionData = move_and_collide(linear_velocity) # returns KinematicCollision
	
	if collisionData:
		if collisionData.collider.name == "Player":
			print("bear collided with player")


