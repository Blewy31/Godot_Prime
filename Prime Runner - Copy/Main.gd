extends Spatial

var ground_length = 100
var player_pos : Vector3
signal del_ground

onready var cylinder = preload("res://Ground.tscn")
onready var ground_holder = get_node('Ground_Place')

func _ready():
	make_ground()
	

func _process(delta):
	player_pos = $Player.translation
	
	if player_pos.z <= (Global.ground_loc.z + 60):
#		print_debug("adding")
#		print_debug(player_pos.z)
#		print_debug(Global.ground_loc.z)
		make_ground()

func make_ground():
	var ground = cylinder.instance()
	ground.translate(Global.ground_loc)
	ground_holder.add_child(ground)
	Global.ground_loc.z -= ground_length
	
