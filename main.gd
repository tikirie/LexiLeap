extends Node2D

var DIR = OS.get_executable_path().get_base_dir()
var interpreter_path = DIR.path_join("PythonFiles/venv/Scripts/python")
var script_path = DIR.path_join("PythonFiles/get_words.py")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !OS.has_feature("standalone"): # if NOT exported version
		interpreter_path = ProjectSettings.globalize_path("res://PythonFiles/venv/Scripts/python")
		script_path = ProjectSettings.globalize_path("res://PythonFiles/get_words.py")
	var result = get_words()
	var levels = result[0]
	var synonyms = result[1]
	var antonyms = result[2]
	var heights = []
	heights.append(0)
	$Word1.text = levels[0]
	heights.append($Word1.position.y)
	$Word2.text = levels[1]
	heights.append($Word2.position.y)
	$Word3.text = levels[2]
	heights.append($Word3.position.y)
	$Word4.text = levels[3]
	heights.append($Word4.position.y)
	$Word5.text = levels[4]
	heights.append($Word5.position.y)
	heights.append(1920)
	#var syn = []
	for i in len(synonyms):
		var temp = synonyms[i].split(", ")
		for j in len(temp):
			#syn.append(temp[j])
			new_label(temp[j], heights[i], heights[i + 1])
	for i in len(antonyms):
		var temp = antonyms[i].split(", ")
		for j in len(temp):
			new_label(temp[j], heights[i], heights[i + 1])
	#for j in len(syn):
		#print(syn[j])
	
func get_words():
	var output = []
	OS.execute(interpreter_path, [script_path], output)
	var words = output[0].split("\r\n")
	var levels = []
	var synonyms = []
	var antonyms = []
	for i in 15:
		words[i] = words[i].replace("{", "")
		words[i] = words[i].replace("}", "")
		words[i] = words[i].replace("'", "")
		if (i == 0 || i == 3 || i == 6 || i == 9 || i == 12):
			levels.append(words[i])
		elif (i == 1 || i == 4 || i == 7 || i == 10 || i == 13):
			synonyms.append(words[i])
		elif (i == 2 || i == 5 || i == 8 || i == 11 || i == 14):
			antonyms.append(words[i])
		print(words[i])
	return [levels, synonyms, antonyms]

func new_label(word, min, max):
	var new_l = Label.new()
	new_l.text = word
	add_child(new_l)
	var screenSize = get_viewport().get_visible_rect().size
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var rndX = rng.randi_range(0, screenSize.x)
	var rndY = rng.randi_range(min, max)
	new_l.position = Vector2(rndX, rndY)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
