extends Spatial

# README for importing models
# using Blender 2.8, there is an export for gITF 2.0
# use that and use the "gITF (embedded)" option

# for animations, do everything in the Action editor since
# Godot can read those in and make it easier to switch out later

# The importing the gITF file to Godot is a bit odd
# you have to drag the file into the project, then try to double
# click the file to open it. Save it as a new scene since you cannot
# import the mesh file directly (I am guessing because it contains scene data)
# you can attach a script like this to the object linked in the parent
# this will target the component inside to play

func _ready():
	
	# just play animation on start
	var anim = $AnimationPlayer	
	if anim.has_animation("Idle"): 
		anim.play("Idle")


