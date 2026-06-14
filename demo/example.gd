extends Node

func _ready() -> void:
	var example := ExampleClass.new()
	#example.print_type(example)
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
		
	var xlight = TrafficLight.new()	
	#var custom_script = load("res://traffic_light.gd")
	#light.set_script(custom_script)
	var light = $MarginContainer/HBoxContainer/TrafficLight
	print("Intial Should Be 5")
	print(light.get_light_type())			
	light.show_next_light()
	print("After first change (50):")
	print(light.get_light_type())
	await get_tree().create_timer(1.0).timeout	
	light.show_next_light()
	print("After Second Change (500)")
	print(light.get_light_type())
	
	
func on_sum_changed(sum):
	pass
	#print(str(sum))
		
