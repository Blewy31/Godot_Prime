extends StaticBody

onready var end = get_node("End")
onready var main = get_tree().get_root().find_node('Main',true,false)
onready var test = preload('res://NumberBoard.tscn')
onready var test_ring = get_node("Test_Ring")

var wr = weakref(self)

var score = 0

func _ready():
	spawn_test(12)
	main.connect('del_ground',self,'goodbye')

func _process(delta):
	pass



func spawn_test(num):
	for i in range(num):
		var t = test.instance()
		test_ring.add_child(t)
		t.global_rotate(Vector3(0,0,1),PI * i / 6)

func goodbye():
	print('delete')
	queue_free()
