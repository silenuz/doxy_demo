extends Node

func _ready() -> void:
	var example := ExampleClass.new()
	example.print_type(example)
	var sum = Summator.new()
	sum.sum_changed.connect(on_sum_changed)
	sum.add(5)
	sum.add(7)
	var total = sum.get_total()
	print(total)
	var tl = TrafficLight.new()

func on_sum_changed(sum):
	print(str(sum))
