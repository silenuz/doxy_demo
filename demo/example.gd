extends Node

func _ready() -> void:
	var example := ExampleClass.new()
	example.print_type(example)
	var sum = Summator.new()
	sum.sum_changed.connect(on_sum_changed)
	sum.add(50)
	sum.add(70)
	var total = sum.get_total()
	print(total)
	if total >= sum.SUM_GOOD:
		print("Life is good")
	elif total >= sum.SUM_OKAY:
		print("Could be doing better")
	elif total >= sum.SUM_REQUIRED:
		print("At least you making rent")
	else:
		print("Your broke")		
		
	var tl = TrafficLight.new()

func on_sum_changed(sum):
	print(str(sum))
