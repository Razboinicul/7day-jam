extends Node

var level: int = 0
const max_level: int = 0

func next_level():
	if level != max_level:
		level += 1
		print("Going to next level")
		var level_string: String = "res://Levels/Level"+str(level)+".tscn"
		get_tree().change_scene_to_file(level_string)
	else:
		print("No next level")
		get_tree().quit() #Placeholder
