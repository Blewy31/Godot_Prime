extends KinematicBody

export var speed = 1.5
export var gravity_accel = 10
var velocity = Vector3()
var grav_force = Vector3()
var forward_momentum = Vector3(0,0,-1)
var acting_force = Vector3.ZERO
var count = 0

onready var ground = get_parent().get_node("Ground_Place")


func _ready():
	pass

func _physics_process(delta):
	count += 1*delta
	grav_force = Vector3(ground.translation.x - self.global_translation.x,
	ground.translation.y - self.global_translation.y, 0).normalized()*gravity_accel
	if count > 10 and count < 10.1:
		print_debug(ground.translation.x,'-', self.global_translation.x,'=',ground.translation.x-self.global_translation.x)
		print_debug(ground.translation.y,'-',self.global_translation.y,'=',ground.translation.y-self.global_translation.y)
	
	velocity += (grav_force + forward_momentum * speed)* delta
	get_input(delta)
	velocity = move_and_slide_with_snap(velocity,Vector3.DOWN*2,Vector3.UP)
	var ground_face_normal = $RayCast.get_collision_normal()
	global_transform = align_with_surface(global_transform, ground_face_normal)


func align_with_surface(xform,newUP):
	xform.basis.y = newUP
	xform.basis.x = -xform.basis.z.cross(newUP)
	xform.basis = xform.basis.orthonormalized()
	return xform

func get_input(delta):
	if Input.is_action_pressed("move_clockwise"):
		velocity += Vector3((-5) * PI / 6 * delta, 0, 0)
#		self.rotate_z(-PI/6)
	if Input.is_action_pressed("move_counterclockwixe"):
		velocity += Vector3((5) * PI / 6 * delta, 0, 0)
#		self.rotate_z(PI/6)
