extends Area


var num_to_quiz : int
var rng = RandomNumberGenerator.new()


func _ready():
	rng.randomize()
	num_to_quiz = fetch_num()
	$Label3D.text = str(num_to_quiz)
#	print(Global.board_num)

func _on_NumberBoard_entered(body):
	if body.get_name() == 'Player':
		queue_free()

func fetch_num():
	if Global.board_num.size() != 0:
		var item_num = rng.randi_range(1,100) % Global.board_num.size()
		var num_to_pass = Global.board_num[item_num]
		Global.board_num.remove(item_num)
		return(num_to_pass)
	else:
		Global.fill_board_num(6,6)
		var item_num = rng.randi_range(1,100) % Global.board_num.size()
		var num_to_pass = Global.board_num[item_num]
		Global.board_num.remove(item_num)
		return(num_to_pass)

