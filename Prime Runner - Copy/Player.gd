extends KinematicBody

export var speed = 2
export var gravity_accel = 1
var velocity = Vector3()
var grav_force = Vector3()
var forward_momentum = Vector3(0,0,-1)
var acting_force = Vector3.ZERO
var rotation_dir = 0

func _ready():
	pass

func _physics_process(delta):
	grav_force = Vector3(-get_node('/root/Main/Player').transform.origin.x,
	-get_node('/root/Main/Player').transform.origin.y,0).normalized()*gravity_accel
	
	velocity += (grav_force + forward_momentum * speed)* delta
	get_input()
	move_and_slide(velocity)

func align_with_surface(xform,newUP):
	xform.basis.y = newUP
	xform.basis.x = -xform.basis.z.cross(newUP)
	xform.basis = xform.basis.orthonormalized()
	return xform

func get_input():
	if Input.is_action_just_pressed("move_clockwise"):
#		get_node('/root/Main/Player').rotate_z(-PI/6)
		self.rotate_z(-PI/6)
	if Input.is_action_just_pressed("move_counterclockwixe"):
#		get_node('/root/Main/Player').rotate_z(PI/6)
		self.rotate_z(PI/6)
