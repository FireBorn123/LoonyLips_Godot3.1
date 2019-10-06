extends Control



func _ready():
	var StoryWords = ["Bob", "fast", "tired" , "bed" ]
	var StoryScript = "In the beginning, there was %s and he was %s. In the end, he felt %s, and thus went to %s."

	get_node("DisplayText").text = StoryScript % StoryWords
	#Shortcut is $DisplayText.text = "Text 1" and will be used from now on

