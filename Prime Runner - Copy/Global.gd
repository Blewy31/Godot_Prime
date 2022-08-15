extends Node

onready var not_primes = [1]
onready var primes = [2,3]
onready var rng = RandomNumberGenerator.new()
var board_num = []
var ground_loc = Vector3(0,0,0)

func _ready():
	fill_primes(101)
	rng.randomize()
	fill_board_num(6,6)
#	print(board_num)
	

func fill_primes(num):
	for check_num in range(num):
		for i in range(2,floor(sqrt(check_num))+1):
			if (check_num % i) == 0:
				not_primes.append(check_num)
				break
			elif i == (floor(sqrt(check_num))):
				primes.append(check_num)

func fill_board_num(nump,numn):
	for _i in range(nump):
		board_num.append(primes[rng.randi_range(1,1000)%primes.size()])
	for _i in range(numn):
		board_num.append(not_primes[rng.randi_range(1,1000)%not_primes.size()])

